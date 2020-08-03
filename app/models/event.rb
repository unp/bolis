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
end
