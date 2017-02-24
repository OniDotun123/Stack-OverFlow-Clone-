get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id #logic that signs user in
      binding.pry
      redirect '/questions'
    else
      erb :'/users/new'
    end
end

get '/users/login' do
  erb :'/users/login'
end

post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'/users/show'
    else
      erb :'/users/login'
    end
end

get '/logout' do
session.clear
 redirect '/questions'
end
