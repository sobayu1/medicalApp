class AddReferencesToConsultations < ActiveRecord::Migration[5.2]
  def change
    add_reference :consultations, :doctor, foreign_key: true
  end
end
