class FavoritesController < ApplicationController
  def index
    my_favorites = Favorite.where(user: current_user).order(:project_id)
    my_projects = my_favorites.group(:project_id).to_a
    @favorite_projects = my_projects.reject { |favorite_project| favorite_project.project.blank? }

    @my_project = {}
    @favorite_projects.each do |favorite|
      @my_project[favorite.project.name] = my_favorites.where(project: favorite.project) if favorite.project.presence
    end

    @my_favorites_non_project = my_projects.reject { |favorite_project| favorite_project.project.presence }
  end

  def new
    @favorite = Favorite.new
    @favorite.talent_id = params[:talent_id]
    @selectable_projects = Project.selectable_my_project current_user
  end
  def create
    @favorite = Favorite.new(favorite_param)
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
end
