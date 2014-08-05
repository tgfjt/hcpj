class Offer < ActiveRecord::Base
  belongs_to :talent
  belongs_to :project
  belongs_to :user

  validates :project, offer: true

  enum request: {
      confirm_schedule: 1, request_picture: 2, request_self_movie: 3, request_action_movie: 4,
      request_for_appearance: 5, request_for_audition: 6, other: 0
  }
end
