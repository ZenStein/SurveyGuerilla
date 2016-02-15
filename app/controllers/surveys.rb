get '/surveys' do
  @suvery=Survey.all
  erb :'surveys/all_surveys'
end

get 'surveys/:id' do

  erb :'surveys/show'
end

get '/surveys/results' do
  erb :'surveys/results'
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys' do
  @survey = Survey.new(name: params[:name])
  @question= Question.new(question: params[:question])
  @answer= Answer.new(answer: params[:answer])
  if @survey.save
    redirect "/"
  redirect "/surveys/#{survey.id}"
end

post '/surveys/:id' do
  redirect '/surveys/show'
end

