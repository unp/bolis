class Event < ApplicationRecord
  has_many :event_slots, dependent: :destroy
  has_many :slots, through: :event_slots
  belongs_to :site

  acts_as_list
  scope :ordered_by_position, -> { order(position: :asc) }
  scope :not_archived, -> { where(archived: false) }

  validates_inclusion_of(
    :donation_type,
    in: %w(boli nakaro),
    message: "is not 'boli' or 'nakaro'"
  )
  validates_presence_of :min_donation_amount, :name

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["Event", "Slot", "Name(s)", "Email", "Phone", "Type", "Amount"]

      all.ordered_by_position.find_each do |event|
        event.event_slots.each do |event_slot|
          if event_slot.donor_limit
            event_slot.donor_limit.times do |i|
              donation = event_slot.donations[i]
              if donation
                csv << [
                  event.name,
                  event_slot.slot.name,
                  donation.name,
                  donation.email,
                  donation.phone,
                  event.donation_type,
                  ActiveSupport::NumberHelper.number_to_currency(donation.amount)
                ]
              else
                csv << [
                  event.name,
                  event_slot.slot.name,
                  "",
                  "",
                  "",
                  event.donation_type,
                  ActiveSupport::NumberHelper.number_to_currency(event_slot.min_donation_amount)
                ]
              end
            end
          else
            if event_slot.donations.empty?
              csv << [
                event.name,
                event_slot.slot.name,
                "",
                "",
                "",
                event.donation_type,
                ActiveSupport::NumberHelper.number_to_currency(event_slot.min_donation_amount)
              ]
            else
              event_slot.donations.each do |donation|
                csv << [
                  event.name,
                  event_slot.slot.name,
                  donation.name,
                  donation.email,
                  donation.phone,
                  event.donation_type,
                  ActiveSupport::NumberHelper.number_to_currency(donation.amount)
                ]
              end
            end
          end
        end
      end
    end
  end

  def open_slots
    event_slots.select{ |event_slot| event_slot.available? }
  end

  def has_available_slots?
    open_slots.count > 0 && !self.reached_max_sign_ups?
  end

  def reached_max_sign_ups?
    return false if self.max_sign_ups.nil?
    sign_ups = self.event_slots.inject(0) do |donations, event_slot|
      donations + event_slot.donations.count
    end
    self.max_sign_ups <= sign_ups
  end
end
