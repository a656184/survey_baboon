

get '/protected/surveys' do 
  @surveys = Survey.all
  haml :surveys
end
