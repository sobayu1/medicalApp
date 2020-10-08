class CreateConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.string :what_symptom
      t.string :when_symptom
      t.string :desease_treated
      t.string :desease_name
      t.text :specific_consultation
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :consultations, [:user_id, :created_at]
  end
end
