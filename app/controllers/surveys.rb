get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  if logged_in?
    @user = current_user
  erb :'surveys/new'
  else
    redirect '/'
  end
end



get '/surveys/:id' do
  @survey= Survey.find(params[:id])
  p @survey
  erb :'surveys/show'
end



post '/surveys/:id' do
    @survey= Survey.find(params[:id])
    @completed_survey = CompletedSurvey.create(user: current_user, survey: @survey)
  p @completed_survey
    params[:answers].each do |answer_id|
      @completed_survey.answers << Answer.find(answer_id)
    end
    p @completed_survey
  redirect '/'
end

get '/surveys/:id/results' do
  if logged_in?
    @survey= Survey.find(params[:id])
    @user =User.find(session[:id])
    @completed = CompletedSurvey.where(survey: @survey, user: @user)
    p @completed
    puts "LOOK HERE!"
    erb :'/surveys/results'
  else
    redirect '/'
  end
end


post '/surveys' do
  if @new_survey = Survey.create(name: params[:title], user: current_user)
    params[:answer].each_with_index do |(key, choice), index|
      current_question = Question.create(question: params[:questions][index], survey: @new_survey)
      choice.each do |inner_choice|
        current_question.answers << Answer.create(answer: inner_choice)
      end
    end
  redirect "/surveys/#{@new_survey.id}"
  else
    erb :'surveys/new'
  end
end


