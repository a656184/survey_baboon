get '/protected/surveys' do 
  @surveys = Survey.all
  haml :surveys
end

get '/protected/surveys/:survey_id' do
  @survey = Survey.find_by_id(params[:survey_id])

  @survey_participation = SurveyParticipation.new
  # @survey_participation.user = current_user
  # @survey_participation.survey = @survey
  # @survey_participation.completion_status = 'incomplete'
  # @survey_participation.save

  haml :survey_show
end

get '/protected/surveys/new' do

end

post '/protected/surveys/new' do
  
end
