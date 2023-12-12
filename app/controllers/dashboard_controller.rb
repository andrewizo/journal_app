class DashboardController < ApplicationController
  before_action :require_login

  def index
    @tasks = current_user.tasks
    @categories = current_user.categories
    # Other dashboard-related data
  end  
end
