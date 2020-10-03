class Event < ApplicationRecord
  has_many :event_slots, dependent: :destroy
  has_many :slots, through: :event_slots

  acts_as_list
  scope :ordered_by_position, -> { order(position: :asc) }
  scope :not_archived, -> { where(archived: false) }

  validates_inclusion_of(
    :donation_type,
    in: %w(boli nakaro),
    message: "is not 'boli' or 'nakaro'"
  )
  validates_presence_of :min_donation_amount, :name

  def open_slots
    event_slots.select{ |event_slot| !event_slot.donation }
  end
end
