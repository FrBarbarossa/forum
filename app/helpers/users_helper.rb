# frozen_string_literal: true

# Helper for access and auth controll
module UsersHelper
  ACCESS = {
    'visible' => %w[User Moderator Admin],
    'opened' => %w[User Moderator Admin],
    'closed' => %w[User Moderator Admin],
    'hidden' => %w[Moderator Admin],
    'deleted' => ['Admin']
  }.freeze

  NOBODY = Account.new(id: -1, role: 'nobody')

  NOT_EXIST_MSG = 'Страница не существует, или у вас недостаточно прав для её просмотра'

  def log_in(usr)
    session[:user_id] = usr.id
    session[:role] = usr.account.role
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
    reset_session
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

  def admin_only
    redirect_to '/', notice: "У вас недостаточно прав для совершения этого действия" unless session[:role] == "Admin"
  end

  def section_exist_check(sec)
    redirect_to '/', notice: NOT_EXIST_MSG if sec.empty?
    sec.empty?
  end

  def section_visibility_check(sec)
    account = session[:user_id] ? session[:role] : 'nobody'
    statement = ACCESS[sec.first.status].include?(account)
    redirect_to '/', notice: NOT_EXIST_MSG unless statement
    statement
  end

  def section_moderation_check(sec = Section.eager_load(:moderations).where(id: params[:id]))
    account = session[:user_id] ? current_account : NOBODY
    statement = (account.role == 'Admin') || !sec.first.moderations.where(account_id: account.id).where(disabled: false).empty?
    redirect_to '/', notice: NOT_EXIST_MSG unless statement
    statement
  end

  def section_moderation_check_without_redirection(sec = Section.eager_load(:moderations).where(id: params[:id]))
    account = session[:user_id] ? current_account : NOBODY
    statement = (account.role == 'Admin') || !sec.first.moderations.where(account_id: account.id).where(disabled: false).empty?
    statement
  end
  
  def topic_visibility_check_without_redirection(top = Topic.where(id: params[:topic_id]))
    account = session[:user_id] ? session[:role] : 'nobody'
    statement = ACCESS[top.first.status].include?(account)
    statement
  end

  def section_access_check
    @current_section = Section.eager_load(:moderations).where(id: params[:id])
    return if section_exist_check(@current_section)
    return if @current_section.first.status == 'opened'
    return unless section_visibility_check(@current_section)
    return unless section_moderation_check(@current_section)
  end

  def topic_exist_check(top)
    redirect_to '/', notice: NOT_EXIST_MSG if top.empty?
    top.empty?
  end

  def topic_visibility_check(top = Topic.where(id: params[:topic_id]))
    account = session[:user_id] ? session[:role] : 'nobody'
    statement = ACCESS[top.first.status].include?(account)
    redirect_to '/', notice: NOT_EXIST_MSG unless statement
    statement
  end

  def topic_access_check
    @current_topic = Topic.eager_load([{ section: :moderations }]).where(id: params[:topic_id])
    return if topic_exist_check(@current_topic)
    return if @current_topic.first.status == 'opened'
    return unless topic_visibility_check(@current_topic)
    return unless section_moderation_check(Section.eager_load(:moderations).where(id: params[:id]))
  end
end
