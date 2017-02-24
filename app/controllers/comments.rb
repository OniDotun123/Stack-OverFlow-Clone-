get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = Question.find_by(id: params[:question_id])
  erb :'answers/comments/new'
end

post '/answers/:answer_id/comments' do
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = @answer.comments.new(params[:attrs])
  @question = Question.find_by(id: params[:question_id])
  if @answer.save
    redirect "/questions/#{@question.id}"
  end
  erb :'answers/comments/new'
end






get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])

  erb :'questions/comments/new'
end

post '/questions/:question_id/comments' do
  @question = Question.find_by(id: params[:question_id])
  @comment = @question.comments.new(params[:attrs])
  if @comment.save
    redirect "/questions/#{@question.id}"
  end
  erb :'questions/comments/new'
end
