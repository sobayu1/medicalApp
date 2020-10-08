class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :answer_content
      t.references :doctor, foreign_key: true
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
