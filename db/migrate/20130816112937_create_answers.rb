class CreateAnswers < ActiveRecord::Migration
  def change

    create_table :answers do |t|
      t.belongs_to :choice
      t.belongs_to :survey_participation
      t.belongs_to :question
      t.timestamps
    end

    add_index :answers, [:survey_participation_id, :question_id], unique: true
  end
end
