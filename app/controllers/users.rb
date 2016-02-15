get '/users' do
  erb :'index'
end

get '/users/new' do
  erb :'users/new'
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
    @current_user=User.find(session[:id])
    @user =User.find(params[:id])
  erb :'users/show'
  else
    @errors = "Please login to your account"
    redirect '/'
  end
end

get 'users/all' do
  @user=User.find(session[:id])
  @users=User.all
  erb :"users/all_users"
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


