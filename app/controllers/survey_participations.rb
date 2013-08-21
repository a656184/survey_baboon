# if survey not taken -> show a survey form for answering
# else -> redirect to  result view


# I like that you do this, but if you are giving very different
# logic depending on state, maybe give it a different linke
#
# I like what this does, but there is no way to finish a survey
# once I leave the page, even it 1/20 questions answered
# if it was a different route, you could build the link list better

get '/protected/surveys/:survey_id/participation' do
  @survey = Survey.find_by_id(params[:survey_id])

  @survey_participation = SurveyParticipation.where(user_id: current_user, survey_id: @survey)

  if !@survey_participation.empty? && @survey_participation.first.completion_status == "complete"
    @survey_participation = @survey_participation.first
    haml :survey_participation_show
  else 
    haml :survey_show
  end
end

# submit answers for a survey
post '/protected/surveys/:survey_id' do
    
	#	this is a 15 line code block that could absooutely be 
	# extracted into the SurveyParticipation class.
	# 
	# where t stands

	# indentation is important!
  puts "*" * 100
  
	survey = Survey.find_by_id(params[:survey_id])

  survey_participation = current_user.save_participation(survey)

  Answer.save_answers(params[:survey], survey_participation)

  if params[:survey].count == survey.questions.count
    survey_participation.update_attribute(:completion_status, "complete")
  else
    survey_participation.update_attribute(:completion_status, "incomplete")
  end

  redirect to '/protected/surveys'
end


