class Question < ActiveRecord::Base
  validate :content, :presence => true

  belongs_to :survey
  has_many :answers, through: :choices
  has_many :choices

end
