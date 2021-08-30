class AddPrimeEligibleToSlots < ActiveRecord::Migration[6.0]
  def change
    add_column :slots, :prime_eligible, :boolean, default: false, null: false
  end
end
