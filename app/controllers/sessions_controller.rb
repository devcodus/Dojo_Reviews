class SessionsController < ApplicationController
  def new

  end

  def login

    
    puts register_params[:password]
    puts register_params[:email]
    @user = User.find_by_email(register_params[:email]).try(:authenticate, register_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to '/sessions/new'
    end
  end

  def register
    @user = User.new(register_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/sessions/new'
    end
  end

  def destory
    reset_session
    redirect_to '/sessions/new'

  end

  private
    def register_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
