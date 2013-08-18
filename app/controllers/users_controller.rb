get '/users/new' do
  haml :sign_up
end

post '/users' do
  user = User.create(params[:user])
  if user
    session[:user_id] = user.id
  else
    session[:errors] = user.errors.full_messages
  end
  redirect to '/'
end
