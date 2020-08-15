class AddColumnArchivedToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :archived, :boolean, default: false
  end
end
