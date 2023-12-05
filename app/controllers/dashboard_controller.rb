class DashboardController < ApplicationController
  before_action :require_login  # Ensure the user is logged in before accessing the dashboard

  def index
    # Your dashboard logic goes here
  end
end
