class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.references :answerable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
