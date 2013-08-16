helpers do

  def current_user
    if session[:user_id]
      User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    current_user ? true : false
  end

end
