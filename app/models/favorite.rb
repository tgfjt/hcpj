class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :talent

  validates :user, presence: true
  validates :talent, presence: true
  validates :user, uniqueness: { scope: [:project, :talent] }

  default_scope -> { includes(:project, :talent, :user) }
end
