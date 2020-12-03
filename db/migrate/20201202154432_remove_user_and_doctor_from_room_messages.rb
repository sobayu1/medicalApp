class RemoveUserAndDoctorFromRoomMessages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :room_messages, :user, foreign_key: true
    remove_reference :room_messages, :doctor, foreign_key: true
  end
end
