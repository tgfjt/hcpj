class OfferRequest < ActiveRecord::Base
  belongs_to :offer
  belongs_to :request
end
