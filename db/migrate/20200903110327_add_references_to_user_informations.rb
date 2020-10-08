class AddReferencesToUserInformations < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_informations, :user, foreign_key: true
  end
end
