class AddColumnTimesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :times, :string
  end
end
