class TalentsController < ApplicationController
  before_action :set_talent, only: [:show, :edit, :update, :add_my_favorite_confirm, :add_my_favorite]

  def index
    @talents = Talent.all.page params[:page]
  end

  def search
    @talents = Talent.where("name like ?", "%#{params[:talent][:search_param]}%").page params[:page]
    render 'index'
  end

  def new
    @talent = Talent.new
    @talent.build_images
  end

  def create
    @talent = Talent.create(talent_params)
    if @talent.save
      flash[:notice] = 'regist complete'
      redirect_to root_path
    else
      render action :new
    end
  end

  def edit
    @talent.build_images
  end

  def update
    if @talent.update(talent_params)
      flash[:notice] = 'regist complete'
      redirect_to talent_path @talent
    else
      render action :new
    end
  end

  def show
    @myfavorites = @talent.my_favorite_self current_user
  end

  private
  def talent_params
    params.require(:talent).permit(:name,:firstname,:lastname,:mainimage,:age,:sex, :image_delete , { photos_attributes: [ :image, :remove_file, :id, :_destroy ] })
  end

  def set_talent
    @talent = Talent.find(params[:id])
  end

end
