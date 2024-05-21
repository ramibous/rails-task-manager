# app/controllers/tasks_controller.rb# app/controllers/tasks_controller.rb
# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  def index
    puts "Index action called"
    @tasks = Task.all
  end
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to @task
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end
end
