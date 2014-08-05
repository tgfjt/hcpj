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
    @favorite.project_name = favorite_param_project_name[:project_name] if params[:project_id] == -1
    @favorite.user = current_user
    if @favorite.save
      flash[:notice] = 'favorite has been completed.'
      redirect_to root_path
    else
      flash[:alert] = 'favorite has already taken.'
      redirect_to(action: :new, talent_id: @favorite.talent)
    end
  end

  private

  def favorite_param
    params.require(:favorite).permit(:project_id, :talent_id, :memo)
  end
  def favorite_param_project_name
    params.require(:favorite).permit(:project_name)
  end
end
