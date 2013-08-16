require 'spec_helper'


describe "Survey" do #title of test
  
  before(:all) do 
    raise RuntimeError, "Be sure to run rake db:migrate before running these specs" unless ActiveRecord::Migrator.current_version > 0   
    
    @survey = Survey.new({:title => 'this is the title', :description => ('h'*200)})
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

  describe "Title" do 

    it "Should have a title" do

      @survey.title = nil
      @survey.should_not be_valid
    end

    it "Should have a title more than 4 characters and less than 26 characters" do
      @survey.title = "tiny"
      @survey.should_not be_valid

      @survey.title =  'h'*26
      @survey.should_not be_valid
    end

  end

  describe "Description" do

    it "Should have a description" do
      @survey.description = nil
      @survey.should_not be_valid
    end

    it "Should have a description more than 9 characters and less than 251 characters" do

      @survey.description = ('h'*251)
      @survey.should_not be_valid

      @survey.description = 'small'
      @survey.should_not be_valid
    end
  end
end
