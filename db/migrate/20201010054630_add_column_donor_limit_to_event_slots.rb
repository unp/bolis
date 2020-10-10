class AddColumnDonorLimitToEventSlots < ActiveRecord::Migration[6.0]
  def change
    add_column :event_slots, :donor_limit, :integer
  end
end
