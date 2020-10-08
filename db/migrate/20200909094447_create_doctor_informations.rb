class CreateDoctorInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_informations do |t|
      t.string :hospital
      t.string :specialty
      t.text :career
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
