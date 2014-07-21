class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.my_project current_user
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_param)
    @project.user = current_user
    if @project.save
      flash[:notice] = "created successful."
      redirect_to projects_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_param)
      flash[:notice] = "updated successful."
      redirect_to projects_path
    else
      render action: 'edit'
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path
    end
  end

  def show
  end

  private
  def project_param
    params.require(:project).permit(:name, :start_date, :end_date, :description, :other)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
