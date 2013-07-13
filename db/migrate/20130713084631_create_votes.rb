class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count

      t.timestamps
    end
  end
end
