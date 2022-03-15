class RemoveCountFromPollchoice < ActiveRecord::Migration[7.0]
  def change
    remove_column :poll_choices, :count
  end
end
