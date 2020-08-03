class RenameColumnTypeToDonationType < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :type, :donation_type
  end
end
