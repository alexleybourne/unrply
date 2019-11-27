class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :rooms, join_table: :rooms_user_settings

  has_many :messages
  has_many :owned_rooms, class_name: :rooms
  has_many :reactions
end
