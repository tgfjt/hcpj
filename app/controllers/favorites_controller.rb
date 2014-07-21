class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
    @favorite.talent_id = params[:talent_id]
    @selectable_projects = Project.selectable_my_project current_user
  end
  def create
    @favorite = Favorite.new(favorite_param)
    if @favorite.save
      flash[:notice] = 'favorite has been completed.'
      redirect_to root_path
    else
      flash.now[:alert] = 'favorite has already taken.'
      render action: 'new'
    end
  end

  private

  def favorite_param
    params.require(:favorite).permit(:project_id, :talent_id, :memo)
  end
end
