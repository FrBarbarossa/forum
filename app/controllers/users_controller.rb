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
        log_in @user
        redirect_to '/'
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

    private

    def register_params
      params.permit(:login, :password, :password_confirmation, :email) # явно задаем, какие параметры разрешены
    end

    def login_params
      params.permit(:login, :password)
    end
end
