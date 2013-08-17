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

  params[:question][:survey_id] = survey.id
  question = Question.create(params[:question])

  params[:choice][:question_id] = question.id
  choice = Choice.create(params[:choice])

  redirect '/protected/surveys'

end


