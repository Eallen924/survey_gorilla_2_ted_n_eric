helpers do

  def create_questions_and_choices
    @question = @survey.questions.create(:content => params[:question][:content])
    p @question
    choice_1 = @question.choices.create(:content => params[:question][:choice_1])
    p choice_1
    @question.choices.create(:content => params[:question][:choice_2])
    @question.choices.create(:content => params[:question][:choice_3])
    @question.choices.create(:content => params[:question][:choice_4])
  end

end
