class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :question
  belongs_to :survey_participation

  def  self.save_or_update_answers(answers, survey_participation)
    answers.each do |question_id, choice_id|
      answer = Answer.find_or_create_by_question_id_and_survey_participation_id(
        :question_id => question_id, 
        :survey_participation_id => survey_participation.id)

      answer.update_attribute(:choice_id, choice_id)
    end
  end

end
