get '/questions/:question_id/content' do
  @question = Question.find(params[:question_id])
  @question_contents = @question.content
  erb :'/answers/index'
end

get '/questions/:question_id/content/new' do
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end

post '/questions/:question_id/content' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @answer_content = @question.answers.new(params[:question])
  @answer_content.user_id = @user.id
  # line 15 & 16 assign a user id to a question.
    if @answer_content.save
      redirect "/questions/#{@question.id}"
    else
      erb :'/answers/new'
    end
end

get '/questions/:question_id/content/:id/edit' do
  @question = Question.find_by(id: params[:question_id])
   @answer = @question.answers.find_by(id: params[:id])

   erb :'/answers/edit'
end


put '/questions/:question_id/content/:id/edit' do
  # @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update_attributes(content: params[:content])
    # binding.pry
    if @answer.save
      redirect "/questions/#{params[:question_id]}"
    else
      erb :'/answers/edit'
    end
end
