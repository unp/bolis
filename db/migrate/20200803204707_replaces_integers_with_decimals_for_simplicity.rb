class ReplacesIntegersWithDecimalsForSimplicity < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :min_donation_amount_cents
    remove_column :donations, :amount_cents
    add_column :events, :min_donation_amount, :decimal, :precision => 8, :scale => 2
    add_column :donations, :amount, :decimal, :precision => 8, :scale => 2

  end
end
