class OfferController < ApplicationController
  before_action :set_offer, only: [:new, :create]
  def new
    @offer = Offer.new(talent: @talent, project: @project)
  end

  def create
    @offer = Offer.new(offer_param)
    @offer.user = current_user
    @offer.project_name = nil if params[:project_id] == -1
    if @offer.save
      if params[:offer][:offers_requests]
        ids = params[:offer][:offers_requests][:request_id]
        ids.each { |id| OfferRequest.create(offer: @offer, request_id: id) }
      end

      flash[:notice] = 'offer has been completed.'
      redirect_to root_path
    else
      flash[:alert] = @offer.errors.full_messages.first
      render action: :new
    end
  end

  private
  def offer_param
    params.require(:offer).permit(:talent_id, :project_id, :project_name, :request, :memo, :offer_requests => [:request_id])
  end

  def set_offer
    @talent = Talent.find(params[:talent_id])
    @project = Project.find(params[:project_id]) if params[:project_id]
    @selectable_projects = Project.selectable_my_project current_user
  end
end