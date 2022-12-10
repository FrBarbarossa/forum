class UsersController < ApplicationController
    def create
    end

    def signin
    end

    def logout
      redirect_to root_path unless logged_in?
      return unless logged_in?
      log_out
      redirect_to root_path
    end

    def register
      # redirect_to "/?id=#{3}"
      # p "!!!!!!!!!!!!!!!"
      @user = User.new(register_params)
      if @user.valid?
        @user.save
        @user.create_account!({name: params[:name], role: "User", status: "Active"})
        log_in @user
        redirect_to "/lks?user=#{session[:user_id]}"
      end
    end

    def login
      p login_params
      @user = User.find_by(login: login_params[:login])
      p @user
      if @user
        if @user.authenticate(login_params[:password])
          log_in @user
          redirect_to '/'
        end
      end
    end

    # Добавить обработку ошибок модели!
    def avatar
      @account = current_user.account
      @account.avatar.attach(params[:avatar])

      @errors = @account.errors
      render("error", locals:{templ: "errors_avatar"}) unless @errors.empty?
      return unless @errors.empty?

      redirect_to "/lks?user=#{session[:user_id]}"
    end

    # Добавить обработку ошибок модели!
    def name
      @account = current_user.account
      @account.update(name: params[:name])
      

      @errors = @account.errors
      render("error", locals:{templ: "errors_name"}) unless @errors.empty?
      return unless @errors.empty?

      redirect_to "/lks?user=#{session[:user_id]}"
    end

    # Добавить обработку ошибок модели!
    def description
      @account = current_user.account
      @account.update(description: params[:description])
      
      @errors = @account.errors
      render("error", locals:{templ: "errors_desc"}) unless @errors.empty?
      return unless @errors.empty?

      redirect_to "/lks?user=#{session[:user_id]}"
    end

    def lks
      @account = current_user.account
      p @account
      p @account.avatar.attached?
    end

    def modal
      p params[:name]
      @account = current_user.account
    end  

    private

    def register_params
      params.permit(:login, :password, :password_confirmation, :email) # явно задаем, какие параметры разрешены
    end

    def login_params
      params.permit(:login, :password)
    end
end
