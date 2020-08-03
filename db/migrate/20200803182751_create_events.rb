class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :type
      t.string :min_amount_cents
      t.integer :position

      t.timestamps
    end
  end
end
