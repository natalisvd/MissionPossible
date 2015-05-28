class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    # @projects = current_user.projects
  end
  def new
    @task = Task.new
  end
  def show
    @task = Task.find(params[:id])
  end
  def edit
    @task = Task.find(params[:id])
  end
  def create
    @task = Task.create(params_task)
    if @task.save
      redirect_to  task_path(@task)
      flash[:success] = "task created!"
    else
      flash[:error] = "Lol"
    end
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(params_task)
      redirect_to  task_path(@task)
      flash[:success] = "update!"
    else
      flash[:error] = "Lol"
    end
  end
  private
  def params_task
    params.require(:task).permit(:title, :description, :status, :requester_id, :parent_id, :owner_id, :project_id)
  end
end
