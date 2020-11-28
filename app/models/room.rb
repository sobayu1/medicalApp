class Room < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :consultation
  has_many :room_messages
end
