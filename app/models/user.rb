class User < ActiveRecord::Base
  
  include BCrypt

  has_many :surveys
  has_many :survey_participations

  validates :email, presence: true, uniqueness: true

  def self.authenticate(email, password)

    user = User.find_by_email(email)
    return nil if user.nil?

    if user.password == password
      return user
    else
      return nil
    end

  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def save_or_update_participation(survey)
    SurveyParticipation.find_or_create_by_user_id_and_survey_id(
      :user_id => self.id, :survey_id => survey.id)
  end
  
end
