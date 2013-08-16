before do
  @errors = session.delete(:errors) || []
end

get '/' do
  @users = User.all if logged_in?
  haml :index
end
