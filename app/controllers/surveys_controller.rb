# show all surveys
get '/protected/surveys' do
  @user = User.find(session[:user_id])
  @surveys = Survey.where(user_id: @user.id)
  surveys_done = SurveyParticipation.where(user_id: @user.id, completion_status: "complete")
  surveys_in_progress = SurveyParticipation.where(user_id: @user.id) - surveys_done
  @surveys_taken = surveys_in_progress.concat(surveys_done)
  @all_surveys = Survey.all - @surveys_taken.map(&:survey)

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

  questions = []
  choices = []

    params[:questions].each do |question|

      new_question = Question.create(survey_id: survey.id, content: question['content'] )
      questions << new_question

      question['choices'].each do |choice|
        choice = Choice.create(question_id: new_question.id, content: choice)
        choices << choice
      end
    end

  unless survey.errors.any? || questions.any? {|question| question.errors.any?} || choices.any? {|choice| choice.errors.any?}
    redirect '/protected/surveys'
  else
    @error_messages = []

      survey.errors.messages.each do |attribute, error|
        error.each do |error|
          @error_messages << "#{attribute} #{error}"
        end
      end

      questions.each do |question|
        question.errors.messages.each do |attribute, error|
          error.each do |error|
            @error_messages << "Question #{attribute} #{error}"
          end
        end
      end

      choices.each do |choice|
        choice.errors.messages.each do |attribute, error|
          error.each do |error|
            @error_messages << "Choice #{attribute} #{error}"
          end
        end
      end

    @error_messages.reverse!
    haml :new_survey
  end
end

get '/protected/surveys/questions/:question_id/chart_data' do
  chart_data_for_question(params[:question_id])
end
