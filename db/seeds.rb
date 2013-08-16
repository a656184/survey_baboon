require 'faker'

10.times do 
  title = Faker::Company.catch_phrase
  description = Faker::Company.bs
  Survey.create(title: title, description: description)
end
