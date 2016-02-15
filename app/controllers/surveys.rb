get '/surveys' do
  @suvery=Survey.all
  erb :'surveys/all_surveys'
end

get '/surveys/:id' do
  @survey= Survey.find(params[:id])
  erb :'surveys/show'
end

get '/surveys/:id/results' do
  if logged_in?
    @user =User.find(session[:id])
    redirect "/surveys/results/#{@survey.id}"
  else
    redirect '/'
  end
end

get '/surveys/new' do
  if logged_in?
    @user=User.find(session[:id])
  erb :'surveys/new'
  else
    redirect '/'
  end
end

post '/surveys' do
  @survey = Survey.new(name: params[:name])
  @question= Question.new(question: params[:question])
  @answer= Answer.new(answer: params[:answer])
  if @survey.save
    redirect "/surveys/#{survey.id}"
  else
    erb :'surveys/new'
  end
end


