require 'spec_helper'
require 'BCrypt'


describe User do
  
  before do
    @user = User.new({email: "martine@frenchgirl.com",
                     password: "password"})
  end

  subject { @user }

  it { should respond_to(:email)}
  it { should respond_to(:password_hash)}
  it { should respond_to(:password)}
  it { should respond_to(:password=)}

# Currently only returns true if you reset the db with 
#'RACK_ENV=test rake db:setup', and then run tests. Solution?
  it { should be_valid, "only passes after 'RACK_ENV=test rake db:setup'" }

  describe "email"
    describe "when it is not present" do 
      before { @user.email = nil }
      it { should_not be_valid }
    end

    describe "when it is already taken" do
      before do
        user_with_same_email = @user.clone
        user_with_same_email.save
      end

      it { should_not be_valid }
    end

  describe "password" do
    describe "when it is not present" do
      before { @user.password = nil }
      it { should_not be_valid }
    end
  end

  it "should encrypt password" do 
    @user.password.class == BCrypt::Password
  end

end
