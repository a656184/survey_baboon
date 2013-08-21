class SurveyParticipation < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :answers

  def complete(survey, user)
    survey_participation.completion_status = 'complete'
  end
  
end
