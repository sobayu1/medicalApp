class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :doctor, optional: true
end
