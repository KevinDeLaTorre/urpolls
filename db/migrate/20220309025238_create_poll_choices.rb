class CreatePollChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_choices do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :content
      t.integer :count

      t.timestamps
    end
  end
end
