class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.float :height
      t.float :weight
      t.float :waist_circumference
      t.float :right_unaided_eyesight
      t.float :left_unaided_eyesight
      t.float :right_collected_vision
      t.float :left_collected_vision
      t.float :maximum_blood_pressure
      t.string :hearing, :string
      t.float :minimum_blood_pressure
      t.float :hdl_cholesterole
      t.float :ldl_cholesterole
      t.float :neutral_fat
      t.float :ast
      t.float :alt
      t.float :gtp
      t.float :blood_sugar
      t.float :hba1c
      t.float :hemoglobin
      t.integer :red_blood_cells
      t.string :chest_x_ray
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
