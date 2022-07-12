require 'csv'

class Donation < ApplicationRecord
  belongs_to :event_slot
  validates_presence_of :name, :phone, :amount, :event_slot_id
  validate :amount_meets_min
  validate :is_slot_open?

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["Event", "Name(s)", "Email", "Phone", "Type", "Amount"]

      all.find_each do |donation|
        csv << [
          donation.event_slot.event.name,
          donation.name,
          donation.email,
          donation.phone,
          donation.event_slot.slot.name,
          ActiveSupport::NumberHelper.number_to_currency(donation.amount)
        ]
      end
    end
  end

  private

  def is_slot_open?
    if !self.event_slot.available? || self.event_slot.event.reached_max_sign_ups?
      errors[:base] << "This slot is no longer available"
      return false
    end
    true
  end

  def amount_meets_min
    min_amount = event_slot.min_donation_amount
    if amount && amount >= min_amount
      true
    else
      errors.add(:amount, "Must be at least #{
        ActiveSupport::NumberHelper.number_to_currency(amount)}")
      false
    end
  end
end
