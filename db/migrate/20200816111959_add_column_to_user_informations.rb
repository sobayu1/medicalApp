class AddColumnToUserInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_informations, :height, :float
    add_column :user_informations, :weight, :float
    add_column :user_informations, :waist_circumference, :float
    add_column :user_informations, :right_unaided_eyesight, :float
    add_column :user_informations, :left_unaided_eyesight, :float
    add_column :user_informations, :right_collected_vision, :float
    add_column :user_informations, :left_collected_vision, :float
    add_column :user_informations, :hearing, :string
    add_column :user_informations, :maximum_blood_pressure, :float
    add_column :user_informations, :minimum_blood_pressure, :float
    add_column :user_informations, :hdl_cholesterole, :float
    add_column :user_informations, :ldl_cholesterole, :float
    add_column :user_informations, :neutral_fat, :float
    add_column :user_informations, :ast, :float
    add_column :user_informations, :alt, :float
    add_column :user_informations, :gtp, :float
    add_column :user_informations, :blood_sugar, :float
    add_column :user_informations, :hba1c, :float
    add_column :user_informations, :hemoglobin, :integer
    add_column :user_informations, :red_blood_cells, :integer
    add_column :user_informations, :chest_x_ray, :string
  end
end
