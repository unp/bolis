class ChangeMinAmountCentsToBeIntegerInEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :min_amount_cents
    add_column :events, :min_donation_amount_cents, :integer
  end
end
