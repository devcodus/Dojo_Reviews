class UsersController < ApplicationController
  def login

  end
  def login_reg

  end

  def register
    @user = User.create(register_params)
    puts @user.inspect
    puts "???????????????????"
    puts @user.errors.full_messages
    redirect_to '/'
  end

  def logout

  end

  def new
  end

  def create
  end

  def show
  end
  private
    def register_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
