# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
    before_action :find_category
    before_action :find_task, only: [:edit, :update, :destroy]
  
    def create
      @task = @category.tasks.build(task_params)
      if @task.save
        redirect_to category_path(@category), notice: 'Task created successfully.'
      else
        render 'categories/show'
      end
    end
  
    def edit
      # find_task is already called via the before_action
    end
  
    def update
      # find_task is already called via the before_action
      if @task.update(task_params)
        redirect_to category_path(@category), notice: 'Task updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      # find_task is already called via the before_action
      @task.destroy
      redirect_to category_path(@category), notice: 'Task deleted successfully.'
    end
  
    private
  
    def find_task
      @task = @category.tasks.find(params[:id])
    end
  
    def find_category
      @category = Category.find(params[:category_id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date)
    end
  end
  