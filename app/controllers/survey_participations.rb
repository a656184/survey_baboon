# if survey not taken -> show a survey form for answering
# else -> redirect to  result view
get '/protected/surveys/:survey_id/participation' do
  @survey = Survey.find_by_id(params[:survey_id])

  @survey_participation = SurveyParticipation.where(user_id: current_user, survey_id: @survey)

  if @survey_participation.empty?
    haml :survey_show
  else 
    @survey_participation = @survey_participation.first
    haml :survey_participation_show
  end
end

# submit answers for a survey
post '/protected/surveys/:survey_id' do
    
    survey = Survey.find_by_id(params[:survey_id])

    survey_participation = SurveyParticipation.new
  
    survey_participation.user = current_user
    survey_participation.survey = survey
    survey_participation.completion_status = 'complete'
    survey_participation.save
  
  params[:survey].each do |question_id, choice_id|
    
    answer = Answer.new
    answer.survey_participation = survey_participation

    answer.question_id = question_id
    answer.choice_id = choice_id
    answer.save
  
  end

  redirect to '/protected/surveys'
end

