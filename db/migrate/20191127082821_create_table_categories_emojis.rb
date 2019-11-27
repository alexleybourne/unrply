class CreateTableCategoriesEmojis < ActiveRecord::Migration[5.2]
  def change
    create_table :table_categories_emojis do |t|
      t.references :category, foreign_key: true
      t.references :emojiable, polymorphic: true
    end
  end
end
