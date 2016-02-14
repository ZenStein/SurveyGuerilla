get '/users' do
  erb :'index'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/show' do
  erb :'users/show'
end
