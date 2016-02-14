class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :question
      t.references :question

      t.timestamps null: false
    end
  end
end
