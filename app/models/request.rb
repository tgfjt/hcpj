class Request < ActiveRecord::Base
  has_many :offer_requests
  has_many :offers, through: :offer_requests
end
