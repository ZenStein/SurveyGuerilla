get '/users' do
  erb :'index'
end

post '/users' do
  @user=User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
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
    @user=User.find(session[:id])
    current_user==@user
  erb :'users/show'
  else
    @errors = "Please login to your account"
    erb :"sessions/login"
  end
end

get '/users/new' do
  erb :'users/new'
end


