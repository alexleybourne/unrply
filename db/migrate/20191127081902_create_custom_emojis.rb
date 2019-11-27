class CreateCustomEmojis < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_emojis do |t|
      t.string :code
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
