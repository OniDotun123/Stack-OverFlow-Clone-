get '/questions' do
  @questions = Question.all
  erb :"/questions/index"
end

get '/questions/new' do
  require_login
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.update_attributes(user_id: session[:user_id]) #assigns user id to question.
  if @question.save
    redirect '/questions'
  else
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.update_attributes(params[:question])
  redirect "/questions/#{params[:id]}"
end

delete '/questions/:id' do
  require_login
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/questions'
end
