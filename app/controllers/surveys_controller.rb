# show all surveys
get '/protected/surveys' do
  @surveys = Survey.all
  haml :surveys
end


# Form for new survey creation
get '/protected/surveys/new' do
  haml :new_survey
end


# Create a new survey
post '/protected/surveys' do

  params[:survey][:user_id] = session[:user_id]
  survey = Survey.create(params[:survey])

  params[:questions].each do |question|

    new_question = Question.create(survey_id: survey.id, content: question['content'] )

    question['choices'].each do |choice|
      choice = Choice.create(question_id: new_question.id, content: choice)
    end
  end

  redirect '/protected/surveys'
end