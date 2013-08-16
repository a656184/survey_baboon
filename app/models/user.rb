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
  
end
