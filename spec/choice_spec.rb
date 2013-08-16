require 'spec_helper'

describe "Choice" do
  before(:all) do 
    raise RuntimeError, "Be sure to run rake db:migrate before running these specs" unless ActiveRecord:Migrator.current_version > 0   
  end

  it "Should have a 'choices' table" do
    ActiveRecord::Base.connection.table_exists?(:choices).should be_true
  end

end