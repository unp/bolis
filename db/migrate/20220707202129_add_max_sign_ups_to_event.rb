class AddMaxSignUpsToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :max_sign_ups, :integer
  end
end
