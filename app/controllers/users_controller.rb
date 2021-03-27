class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User Succesfully Created'
    else
      render :new, notice: 'Email or Password Invalid'      
    end
  end

  def show
   
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
