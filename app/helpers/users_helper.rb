# frozen_string_literal: true

# Helper for access and auth controll
module UsersHelper
  ACCESS = {
    'visible' => %w[User Moderator Admin],
    'opened' => %w[User Moderator Admin],
    'hidden' => %w[Moderator Admin],
    'deleted' => ['Admin']
  }.freeze

  NOT_EXIST_MSG = 'Страница не существует, или у вас недостаточно прав для её просмотра'

  def log_in(usr)
    session[:user_id] = usr.id
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_account
    @account ||= User.find_by(id: session[:user_id]).account if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_only
    redirect_to '/', notice: 'Вы должны войти в систему для просмотра этой страницы' unless logged_in?
    # render("sessions/login_error") unless logged_in?
  end

  def unlogged_only
    redirect_to '/', notice: 'Вы уже вошли в систему' if logged_in?
    # render("sessions/login_error") unless logged_in?
  end

  def section_exist_check(sec)
    redirect_to '/', notice: NOT_EXIST_MSG if sec.empty?
    sec.empty?
  end

  def section_visibility_check(sec)
    statement = ACCESS[sec.first.status].include?(current_account.role)
    redirect_to '/', notice: NOT_EXIST_MSG unless statement
    statement
  end

  def section_moderation_check(sec)
    account = current_account
    statement = (account.role == 'Admin') or !sec.first.moderations.where(account_id: 1).empty?
    redirect_to '/', notice: NOT_EXIST_MSG unless statement
    statement
  end

  def section_access_check
    @current_section = Section.eager_load(:moderations).where(id: params[:id])
    return if section_exist_check(@current_section)
    return if @current_section.first.status == 'opened'
    return unless section_visibility_check(@current_section)
    return unless section_moderation_check(@current_section)
  end
end
