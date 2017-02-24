#Returns the user object where the session id matches the user id.
def current_user
    @current_user ||= User.find_by(id: session[:user_id])
end

#checks to see if the person is logged in at all.
def require_login
  redirect '/users/login' unless session[:user_id]
end

#returns true or false if they're logged in.
def login?
  !!current_user
end

def authorized?(class_name)
  current_user == class_name.author
end

def this_question(id)
  Question.find_by(id: id)
end

def downvoted?
  !!Downvote.find_by(user_id: current_user.id)
end

def voted?
  !!Vote.find_by(user_id: current_user.id)
end
