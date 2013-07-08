class CompletedSurvey < ActiveRecord::Base

  validates :user_id, :uniqueness => { :scope => :survey_id }

  has_many :answers
  belongs_to :user
  belongs_to :survey


  def tally_surveys_answers(completed_surveys)
    question = Hash.new {|hash, key| hash[key] = 0}
    completed_surveys.each do |completed_survey|
      p tally_answers(completed_survey.answers)
    end
  end

  def tally_answers(answers)
    tallied_answers = Hash.new {|hash, key| hash[key] = 0}
    choices = Hash.new {|hash, key| hash[key] = 0}
    answers.each do |answer|
      p Hash[answer.pluck(:question_id, :choice_id)]
    end
    tallied_answers 
  end
end
