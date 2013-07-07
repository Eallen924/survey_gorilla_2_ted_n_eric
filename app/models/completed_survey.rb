class CompletedSurvey < ActiveRecord::Base

  validates :user_id, :uniqueness => { :scope => :survey_id }

  has_many :answers
  belongs_to :user
  belongs_to :survey
end
