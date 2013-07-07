
get '/user/:user_id' do
  @user = User.find(params[:user_id])
  erb :user_profile
end

get '/user/edit/:user_id' do
	@user = User.find(params[:user_id])
  if current_user.id == @user.id
    erb :edit_profile
  else
  	erb :edit_error
  end
end


post '/update/:user_id' do

	current_user.update_attributes(params[:user])

	redirect "/user/edit/#{current_user.id}"
end


