# show all surveys
get '/protected/surveys' do
  @surveys = Survey.all
  @user = User.find(session[:user_id])
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

  unless survey.errors.any?

    params[:questions].each do |question|

      new_question = Question.create(survey_id: survey.id, content: question['content'] )

      question['choices'].each do |choice|
        choice = Choice.create(question_id: new_question.id, content: choice)
      end
    end
    redirect '/protected/surveys'
  else
    @error_messages = []

      survey.errors.messages.each do |attribute, error|
        error.each do |error|
          @error_messages << "#{attribute} #{error}"
        end
      end

      @error_messages.reverse!
    haml :new_survey
  end


end