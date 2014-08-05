class Admin::OffersController < Admin::ApplicationController
  def index
    @offers = Offer.order("created_at desc")
  end

  def show
  end
end
