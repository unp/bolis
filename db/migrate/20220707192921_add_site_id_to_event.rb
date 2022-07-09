class AddSiteIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :site_id, :integer, null: false
    site = Site.first_or_create
    Event.all.each { |event| event.site_id = site.id }
  end
end
