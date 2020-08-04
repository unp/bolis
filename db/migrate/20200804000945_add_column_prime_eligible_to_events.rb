class AddColumnPrimeEligibleToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :prime_eligible, :boolean, default: false, null: false
  end
end
