

get '/protected/surveys' do 
  @surveys = Survey.all
  haml :surveys
end

get '/protected/surveys/:survey_id' do
  @survey = Survey.find_by_id(params[:survey_id])
  haml :survey_show
end
