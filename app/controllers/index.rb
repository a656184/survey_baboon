before do
  @errors = session.delete(:errors) || []
  @user_id = session[:user_id]
end


# so, this is effective, but makes the url gross and
# doesn't allow for limited viewing, like if you 
# wanted to share results with non-users

# there are ways to do before filters for specific controllers
# and present them with a @current_user object

before '/protected/*' do
  unless logged_in?
    redirect to '/sessions/new'
  end
end

get '/' do
  redirect to '/protected/surveys'
end
