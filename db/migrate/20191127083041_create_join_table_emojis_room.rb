class CreateJoinTableEmojisRoom < ActiveRecord::Migration[5.2]
  def change
    create_join_table :emojis, :rooms do |t|
      t.references :emoji, foreign_key: true
      t.references :room, foreign_key: true
    end
  end
end
