get '/' do
    if logged_in?
    @user=User.find(session[:id])
    redirect "users/#{@user.id}"
  else
    erb :'index'
  end
end





