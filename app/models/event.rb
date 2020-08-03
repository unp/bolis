class Event < ApplicationRecord
  has_many :event_slots
  has_many :slots, through: :event_slots

  acts_as_list
  scope :ordered_by_position, -> { order(position: :asc) }

  validates_inclusion_of(
    :donation_type,
    in: %w(boli nakaro),
    message: "is not 'boli' or 'nakaro'"
  )
  validates_presence_of :min_donation_amount

  def open_slots
    event_slots.select{ |event_slot| !event_slot.donation }
  end
end
