class Room < ApplicationRecord
  belongs_to :owner, class_name: :user

  has_and_belongs_to_many :users, join_table: :rooms_user_settings
  has_and_belongs_to_many :emojis
  has_and_belongs_to_many :achievements

  has_many :custom_emojis
  has_many :messages
  has_many :typing_messages

  def message_blocks
    previous_user = nil
    message_block = []

    messages.each_with_object([]) do |acc, message|
      if message.user == previous_user
        message_block.push(message)
      else
        previous_user = message.user
        acc.push(message_block)
        message_block = [message]
      end
    end.push(message_block)
  end
end
