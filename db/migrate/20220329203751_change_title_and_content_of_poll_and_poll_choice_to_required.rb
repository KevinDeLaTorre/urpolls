class ChangeTitleAndContentOfPollAndPollChoiceToRequired < ActiveRecord::Migration[7.0]
  def change
    change_column_null :polls, :title, false
    change_column_null :poll_choices, :content, false
  end
end
