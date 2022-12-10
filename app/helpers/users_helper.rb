module UsersHelper
  def log_in(usr)
    session[:user_id] = usr.id
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_only
    redirect_to '/', notice: "Вы должны войти в систему для просмотра этой страницы" unless logged_in?
    # render("sessions/login_error") unless logged_in?
  end

  def unlogged_only
    redirect_to '/', notice: "Вы уже вошли в систему" if logged_in?
    # render("sessions/login_error") unless logged_in?
  end

end
