class RemoveDoctorFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rooms, :doctor, foreign_key: true
  end
end
