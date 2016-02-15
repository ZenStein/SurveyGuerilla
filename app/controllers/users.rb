get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "users/#{@user.id}"
  else
    @errors=@user.errors.full_messages
    "This information already exists. Please try another email."
  end
end

get '/users/:id' do
  if logged_in?
    @current_user= current_user
    p @completed = CompletedSurvey.where(user: @current_user)
    @completed = CompletedSurvey.where(user: @current_user)
  erb :'users/show'
  else
    @errors = "Please login to your account"
    redirect '/'
  end
end


delete 'users/:id' do
  @user_account=User.find(params[:id])
  @session=session[:id]
  if current_user=@user_account
    @user.destroy
    @session= nil
    redirect '/'
  end
end


