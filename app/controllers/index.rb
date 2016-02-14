get '/' do
  @sign_text = params[:sign_text]
  # Look in app/views/index.erb
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

get '/users/show' do
  erb :'users/show'
end

get '/surveys/results' do
  erb :'surveys/results'
end
get '/surveys/new' do
  erb :'surveys/new'
end
get '/surveys/show' do
  erb :'surveys/show'
end

