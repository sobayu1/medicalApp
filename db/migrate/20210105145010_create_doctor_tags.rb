class CreateDoctorTags < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_tags do |t|
      t.references :doctor, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
