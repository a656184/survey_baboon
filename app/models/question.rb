class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates :content, presence: true
  validates :content, length: { in: 1..250 }
end
