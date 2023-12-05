class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
    
        if @user && @user.authenticate(params[:password])
          log_in(@user)
          redirect_to root_path, notice: 'Login successful.'  # Redirect to the dashboard
        else
          flash.now[:alert] = 'Invalid email or password.'
          render :new
        end
    end
  
    def destroy
      log_out  # Assuming you have a log_out method in your SessionsHelper
      redirect_to login_path, notice: 'Logged out successfully.'
    end
  end
  