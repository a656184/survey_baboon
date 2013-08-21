class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  validates :title, :description, presence: true
  validates :title , length: {in: 5..25}
  validates :description , length: {in: 10..250}
end

# @complete = true
# survey.questions.each do |question|
#   @answer = A
#   @complete = false if #question.id == Answers.where(question_id: question.id, user)
#   Answer.survey_participation
# end
