class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :doctor_rate
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
