class AddColumnToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :sex, :string
    add_column :doctors, :birth_date, :date
  end
end
