# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :require_login

  def index
    @tasks = current_user.tasks
    @categories = current_user.categories
    @tasks_due_today_by_category = {}

    # Debugging statement
    puts "Current date: #{Date.today}"

    @categories.each do |category|
      tasks_due_today = category.tasks.where(due_date: Date.today.beginning_of_day..Date.today.end_of_day)
      puts "Category: #{category.name}, Tasks Due Today: #{tasks_due_today.inspect}"
      @tasks_due_today_by_category[category] = tasks_due_today if tasks_due_today.present?
    end
  end
end
