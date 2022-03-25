class AddUniqueUserPollIndexToVotes < ActiveRecord::Migration[7.0]
  def change
    add_index :votes, [:user_id, :poll_id], unique: true
  end
end
