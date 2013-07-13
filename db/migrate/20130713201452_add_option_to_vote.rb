class AddOptionToVote < ActiveRecord::Migration
  def change
    add_column :votes, :optionName, :string
  end
end
