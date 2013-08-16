get '/sessions/new' do
  haml :sign_in
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to '/'
  elsif
    session[:errors] = ['Invalid Login']
    redirect to '/sessions/new'
  end
end

get '/sessions/delete' do
  session.clear
  redirect to '/'
end
