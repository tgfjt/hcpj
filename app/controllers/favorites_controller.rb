class FavoritesController < ApplicationController
  def index
    my_favorites = Favorite.my_favorites current_user
    @favorite_projects = Favorite.my_favorite_selected_project current_user

    @my_project = {}
    @favorite_projects.each do |favorite|
      @my_project[favorite.project.name] = my_favorites.where(project: favorite.project) if favorite.project.presence
    end

    @my_favorites_non_project = Favorite.my_favorite_non_project current_user
  end

  def new
    @favorite = Favorite.new
    @favorite.talent_id = params[:talent_id]
    @selectable_projects = Project.selectable_my_project current_user
  end

  def create
    @favorite = Favorite.new(favorite_param)
    @favorite.project_name = nil unless @favorite.project_id == -1

    @favorite.user = current_user
    if @favorite.save
      flash[:notice] = 'favorite has been completed.'
      redirect_to root_path
    else
      flash[:alert] = 'favorite has already taken.'
      redirect_to(action: :new, talent_id: @favorite.talent)
    end
  end

  def show_project_detail
    @talent = Talent.find(params[:talent_id])
    @project = Project.find(params[:project_id])
    @favorite = Favorite.where(project: @project, talent: @talent).first
  end

  def project_detail
    @talent = Talent.find(params[:talent_id])
    @project = Project.find(params[:project_id])
    @favorite = Favorite.where(project: @project, user: current_user, talent: @talent).first
    if @favorite.update(favorite_param)
      flash[:notice] = 'regist complete'
      redirect_to project_path @project
    end
  end

  private

  def favorite_param
    params.require(:favorite).permit(:project_id, :talent_id, :memo, :project_name)
  end
end
