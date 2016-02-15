get '/' do
    if logged_in?
    @user=User.find(session[:id])
    erb :'users/show'
  else
    redirect '/users'
  end
end





