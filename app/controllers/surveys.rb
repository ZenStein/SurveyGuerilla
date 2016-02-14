get '/surveys/results' do
  erb :'surveys/results'
end

get '/surveys/new' do
  erb :'surveys/new'
end

get '/surveys/show' do
  erb :'surveys/show'
end

get 'surveys/:id' do

  erb :'surveys/show'
end
