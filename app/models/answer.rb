class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :question
  belongs_to :survey_participation

  def  self.save_answers(answers, survey_participation)
    answers.each do |question_id, choice_id|
      answer = Answer.new
      p survey_participation
      answer.survey_participation = survey_participation
      answer.question_id = question_id
      answer.choice_id = choice_id
      answer.save
    end
  end

end
