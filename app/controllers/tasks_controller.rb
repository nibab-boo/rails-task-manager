class TasksController < ApplicationController
  before_action :finding_id, only: [:show, :edit, :destroy, :update, :check]
  def index
    @tasks = Task.all
  end
  
  def show; end
  
  def new
    @task = Task.new
  end
  
  def create
    task = Task.create(param_filter.except(:completed))
    redirect_to tasks_path
  end
  
  def edit; end

  def update
    @task.update(param_filter)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def check
    @task.completed = !@task.completed
    @task.save
    redirect_to tasks_path
  end

  private

  def param_filter
    params.require(:task).permit(:title, :details, :completed)
  end

  def finding_id
    @task = Task.find(params[:id])
  end
end
