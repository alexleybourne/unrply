class Room < ApplicationRecord
  belongs_to :owner, class_name: :user

  has_many :messages

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
