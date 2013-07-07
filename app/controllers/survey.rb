get '/surveys_list' do 
  @surveys = Survey.all
  erb :surveys_list
end

get'/surveys/new' do
  @survey = Survey.new
  erb :survey_new
end

get '/add_question' do
  erb :add_question
end

get'/survey/:survey_id' do 
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/responses/:survey_id' do 
  if CompletedSurvey.where(:user_id => current_user.id, :survey_id => params[:survey_id]).empty?
    @completed_survey = current_user.completed_surveys.create(survey_id: params[:survey_id])
    params[:question].each do |question, answer|
      @completed_survey.answers.create(:question_id => question, :choice_id => answer)
    end
    redirect 'surveys_list'
  else
    session[:errors]
    erb :sorry
  end
end

post '/survey/new' do
  @survey = Survey.create(user_id: current_user.id, title: params[:survey][:title])
  question = Question.create(:content => params[:question][:content])
  @survey.questions << question
  params[:question][:choices].each do |choice, value|
    question.choices << Choice.create(:content => value)
  end
  erb :survey_add_question
end

post '/survey/:survey_id/add_questions' do
  @survey = Survey.find(params[:survey_id])
   question = Question.create(:content => params[:question][:content])
  @survey.questions << question
  params[:question][:choices].each do |choice, value|
    question.choices << Choice.create(:content => value)
  end
  erb :survey_add_question
end
