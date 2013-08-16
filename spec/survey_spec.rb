require 'spec_helper'


describe "Survey" do #title of test
  before(:all) do 
    raise RuntimeError, "Be sure to run rake db:migrate before running these specs" unless ActiveRecord:Migrator.current_version > 0   
  end

  it "Should have a 'surveys' table" do
    ActiveRecord::Base.connection.table_exists?(:surveys).should be_true
  end


  it "The 'surveys' table should have the right columns and data types" do
    
    expected = {
      :integer => ["id", "user_id"],
      :string => ["title", "description"],
      :datetime => ["created_at","updated_at"]
    }


    ActiveRecord::Base.connection.columns(:surveys).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end

  it "Should have a title" do

    test_survey_args = { description: 'this is the description' }

    test_survey = Survey.new(test_survey_args)

    test_survey.should_not be_valid
  end

  it "Should have a title more than 5 characters and less than 25 characters"
    test_survey_args = { title: "tiny"}

    test_survey = Survey.new(test_survey_args)

    test_survey.should_not be_valid

    test_survey_args_2 = {title: 'h'*26}

    test_survey_2 = Survey.new(test_survey_args_2)
    
    test_survey_2.should_not be_valid
  end

  it "Should have a description"
    test_survey_args = { title: 'this is the title'}

    test_survey = Survey.new(test_survey_args)

    test_survey.should_not be_valid
  end

  it "Should have a description more than 10 characters and less than 250 characters"

    test_survey_args = { title: 'this is the title' description: ('h'*251)}

    test_survey = Survey.new(test_survey_args)

    test_survey.should_not be_valid

    test_survey_args_2 = { title: 'this is the title' description: 'small'}

    test_survey_2 = Survey.new(test_survey_args_2)

    test_survey_2.should_not be_valid
  end
end
