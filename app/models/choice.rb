class Choice < ActiveRecord::Base
  validate :content, :presence => true
  
  belongs_to :question
  has_many :answers
end
