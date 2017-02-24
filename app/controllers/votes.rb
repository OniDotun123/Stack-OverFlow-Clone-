get '/upvote/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.votes.create()

  redirect "/questions/#{@question.id}"
end
get '/downvote/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.downvotes.create()

  redirect "/questions/#{@question.id}"
end





get '/upvote/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  @answer.votes.create()

  redirect "/questions/#{@question.id}"
end
get '/downvote/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  @answer.downvotes.create()

  redirect "/questions/#{@question.id}"
end


get '/upvote/:question_id/comments/:id' do
  @comment = Comment.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  @comment.votes.create()

  redirect "/questions/#{@question.id}"
end
get '/downvote/:question_id/comments/:id' do
  @comment = Comment.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  @comment.downvotes.create()

  redirect "/questions/#{@question.id}"
end
