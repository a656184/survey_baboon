before do
  @errors = session.delete(:errors) || []
end

before '/protected/*' do
  unless logged_in?
    redirect to '/sessions/new'
  end
end

get '/' do
  redirect to '/protected/surveys'
end
