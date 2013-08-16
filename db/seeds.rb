require 'faker'

Survey.destroy_all
Question.destroy_all
Choice.destroy_all

10.times do 
  title = Faker::Company.catch_phrase
  description = Faker::Company.bs
  survey = Survey.create(title: title, description: description)
  10.times do
    content = Faker::Company.bs + '?'
    question = Question.create(content: content)
    survey.questions << question
    4.times do 
      content = Faker::Company.name
      choice = Choice.create(content: content)
      question.choices << choice
    end
  end
end
