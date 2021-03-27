class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Successfuly Logged In'
    else
      render action: :new, notice: 'Invalid E-mail or Password'    
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged Out Successfuly'
  end
end
