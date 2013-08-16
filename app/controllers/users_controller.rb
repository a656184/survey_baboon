get '/users/new' do
  haml :sign_up
end

post '/users' do
  user = User.create(params[:user])
  session[:errors] = user.errors.full_messages
  redirect to '/'
end
