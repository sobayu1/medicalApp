class Room < ApplicationRecord
  belongs_to :consultation
  has_many :room_messages, dependent: :destroy
end
