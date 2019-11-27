class CreateTypingMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :typing_messages do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
