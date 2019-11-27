class Reaction < ApplicationRecord
  belongs_to :emoji
  belongs_to :user
  belongs_to :message
end
