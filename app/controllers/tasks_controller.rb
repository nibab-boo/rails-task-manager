class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    # raise
    task = Task.create(param_filter)
    redirect_to task_path(task)
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(param_filter)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def param_filter
    params.require(:task).permit(:title, :details)
  end

  # def finding_id
  #   @task = Task.find(params[:id])
  # end

end
