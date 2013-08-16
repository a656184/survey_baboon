get '/protected/surveys' do 
  @surveys = Survey.all
  haml :surveys
end


get '/protected/surveys/new' do

end

post '/protected/surveys/new' do
  
end