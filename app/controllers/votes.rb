get '/upvote/questions/:id' do
  @question = Question.find_by(id: params[:id])
  vote = @question.votes.create(user_id: current_user.id)
  found = Downvote.find_by(user_id: current_user.id)

  Downvote.destroy(found.id)  if downvoted?

  redirect "/questions/#{@question.id}"
end
get '/downvote/questions/:id' do
  @question = Question.find_by(id: params[:id])
  found = @question.downvotes.create(user_id: current_user.id)

  Vote.destroy(found.id)  if voted?

  redirect "/questions/#{@question.id}"
end





get '/upvote/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  found = @answer.votes.create(user_id: current_user.id)

  Downvote.destroy(found.id)  if downvoted?

  redirect "/questions/#{@question.id}"
end
get '/downvote/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  found = @answer.downvotes.create(user_id: current_user.id)

  Vote.destroy(found.id)  if voted?

  redirect "/questions/#{@question.id}"
end


get '/upvote/:question_id/comments/:id' do
  @comment = Comment.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  found = @comment.votes.create(user_id: current_user.id)

  Downvote.destroy(found.id)  if downvoted?

  redirect "/questions/#{@question.id}"
end
get '/downvote/:question_id/comments/:id' do
  @comment = Comment.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  found = @comment.downvotes.create(user_id: current_user.id)

  Vote.destroy(found.id)  if voted?

  redirect "/questions/#{@question.id}"
end
