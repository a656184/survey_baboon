class CreateSurveyParticipations < ActiveRecord::Migration
  def change
    create_table :survey_participations do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.string :completion_status
      t.timestamps
    end
  end
end
