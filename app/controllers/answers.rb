get '/question/:question_id/content' do
  @question = Question.find(params[:question_id])
  @question_contents = @question.content
  erb :'/answers/index'
end

get '/question/:question_id/content/new' do
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end

post '/question/:question_id/content' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @answer_content = @question.answers.new(params[:content])
    if @answer_content.save
      redirect "/question/#{@question.id}/content"
    else
      erb :'/answers/new'
    end
end
