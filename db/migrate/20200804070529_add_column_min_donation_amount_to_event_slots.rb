class AddColumnMinDonationAmountToEventSlots < ActiveRecord::Migration[6.0]
  def change
    add_column :event_slots, :min_donation_amount, :decimal, :precision => 8, :scale => 2
  end
end
