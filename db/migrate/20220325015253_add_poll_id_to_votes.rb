class AddPollIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :poll_id, :bigint, null: false 
  end
end
