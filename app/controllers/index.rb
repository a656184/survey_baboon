before do
  @errors = session.delete(:errors) || []
  @user_id = session[:user_id]
end

before '/protected/*' do
  unless logged_in?
    redirect to '/sessions/new'
  end
end

get '/' do
  redirect to '/protected/surveys'
end
