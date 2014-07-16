class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_param)
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

  private
  def project_param
    params.require(:project).permit(:name, :start_date, :end_date, :description, :other)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
