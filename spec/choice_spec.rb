require 'spec_helper'

describe "Choice" do
  before(:all) do 
    raise RuntimeError, "Be sure to run rake db:migrate before running these specs" unless ActiveRecord::Migrator.current_version > 0   
    
    @choice = Choice.new({:content => ('happy')})
  end

  it "Should have a 'choices' table" do
    ActiveRecord::Base.connection.table_exists?(:choices).should be_true
  end

  it "The 'choices' table should have the right columns and data types" do
    
    expected = {
      :integer => ["id", "question_id"],
      :string => ["content"],
      :datetime => ["created_at","updated_at"]
    }


    ActiveRecord::Base.connection.columns(:choices).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end

  it "Content should not be empty" do
    @choice.content = nil
    @choice.should_not be_valid
  end

end