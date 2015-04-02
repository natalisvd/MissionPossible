class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
  @projects = current_user.projects
  end
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
  end
  def create
    @project = current_user.projects.create(params_project)
    if @project.save
      redirect_to project_path(@project)
      flash[:success] = "Project created!"
    else
      flash[:error] = "Lol"
    end
  end
  private
  def params_project
    params.require(:project).permit( :name, :deskription )
  end
end
