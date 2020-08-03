class CreateEventSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :event_slots do |t|
      t.references :event, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
