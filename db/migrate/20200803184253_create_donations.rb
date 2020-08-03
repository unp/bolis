class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :amount_cents
      t.references :event_slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
