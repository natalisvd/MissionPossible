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
  def create
    @task = Task.create()
    if @task.save
      redirect_to :back
      flash[:success] = "Project created!"
    else
      flash[:error] = "Lol"
    end
  end
  private
  def params_task
    params.require(:task).permit(:title, :description, :status, :requester_id)
  end
end
