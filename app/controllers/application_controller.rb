class ApplicationController < ActionController::Base
    include SessionsHelper
  
    private
  
    def require_login
      unless logged_in?
        flash[:alert] = 'You must be logged in to access this page.'
        redirect_to login_path
      end
    end
  end
  