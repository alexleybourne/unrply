class Category < ApplicationRecord
  has_many :emoji_joins, class_name: :categories_emojis
  has_many :emojis, through: :emoji_joins
end
