class AddColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :consultation, foreign_key: true
  end
end
