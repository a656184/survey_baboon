require 'spec_helper'

describe SurveyParticipation do

  before do
    @user = User.create(email: 'vise890@gmail.com')
    @survey = Survey.create(title: 'my_surv')
    @survey.questions << Question.create(content: 'my_q')
    @survey_participation = SurveyParticipation.new
  end

  it { should respond_to(:user) }
  it { should respond_to(:survey) }
  it { should respond_to(:completion_status) }

  describe 'user' do

    it 'should be settable' do
      @survey_participation.user = @user
      @survey_participation.save
      @survey_participation.user.should == @user
    end

  end

  describe  'survey' do

    it 'should be settable' do
      @survey_participation.survey = @survey
      @survey_participation.save
      @survey_participation.survey.should == @survey
    end

  end

end
