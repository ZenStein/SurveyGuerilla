class CreateCompletedSurveysTable < ActiveRecord::Migration
  def change
    create_table :completed_surveys do |t|
      t.references :user, :survey, :answer
    end
  end
end
