class Donation < ApplicationRecord
  belongs_to :event_slot
  validates_presence_of :name, :phone, :amount, :event_slot_id
  validate :amount_meets_min

  private

  def amount_meets_min
    min_amount = event_slot.event.min_donation_amount
    if amount && amount >= min_amount
      true
    else
      errors.add(:amount, "Must be at least #{
        ActiveSupport::NumberHelper.number_to_currency(amount)}")
      false
    end
  end
end
