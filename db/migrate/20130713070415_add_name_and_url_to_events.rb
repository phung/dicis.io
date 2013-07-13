class AddNameAndUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :url, :string
  end
end
