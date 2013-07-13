class AddEventIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :eventId, :integer
  end
end
