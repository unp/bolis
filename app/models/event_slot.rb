class EventSlot < ApplicationRecord
  belongs_to :event
  belongs_to :slot
  has_many :donations, dependent: :destroy
  validates_numericality_of :donor_limit, greater_than: 0, allow_nil: true

  def available?
    donor_limit.nil? || donor_limit > donations.length
  end
end
