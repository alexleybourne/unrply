class Emoji < ApplicationRecord
  belongs_to :categories_emojis, polymorphic: true

  has_many :categories, through: :categories_emojis
  has_many :reactions, as: :emojiable
end
