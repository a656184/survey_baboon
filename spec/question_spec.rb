require 'spec_helper'

describe "Question" do
  before(:all) do 
    raise RuntimeError, "Be sure to run rake db:migrate before running these specs" unless ActiveRecord:Migrator.current_version > 0   
  end

  it "Should have a 'quetions' table" do
    ActiveRecord::Base.connection.table_exists?(:questions).should be_true
  end


  it "The 'questions' table should have the right columns and data types" do
    
    expected = {
      :integer => ["id", "survey_id"],
      :string => ["content"],
      :datetime => ["created_at","updated_at"]
    }


    ActiveRecord::Base.connection.columns(:questions).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end

  it "Should have content"

    test_question_args = {}

    test_question = Question.new(test_question_args)

    test_question.should_not be_valid
  end

  it "Should have content more than 0 characters and less than 250 characters"

    test_question_args = { content: ''}

    test_question = Question.new(test_question_args)

    test_question.should_not be_valid

    test_question_args_2 = { content: 'h'*251}

    test_question_2 = Question.new(test_question_args_2)

    test_question_2.should_not be_valid
  end  
end