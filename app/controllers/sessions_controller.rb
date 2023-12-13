class SessionsController < ApplicationController
  def create
    user_params = params.require(:user).permit(:email, :password)
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      log_in user
      redirect_to root_path, notice: 'Login successful!'
    else
      @user = User.new(email: user_params[:email])
      @user.errors.add(:base, 'Invalid email or password') 
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
