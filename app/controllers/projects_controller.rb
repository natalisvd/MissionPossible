class ProjectsController < ApplicationController
  helper ProjectsHelper
  before_action :authenticate_user!
  def index
  @projects = current_user.projects
  end
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
    @first_level_tasks = @project.tasks.where(:parent => nil)
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
  def add_member_to_project
    if User.where(:email=> "#{params['email']}").length > 0 && Project.find(params['project_id']).user.email != params['email']
      @add_user_to_project = UserToProject.create(user: User.where(:email=> "#{params['email']}").first, project_id: params['project_id'])
      redirect_to :back
    else
      p "sdfsdf"
      render :json => {arrors: 'errors'}
    end
  end

  private
  def params_project
    params.require(:project).permit( :name, :description )
  end
end
