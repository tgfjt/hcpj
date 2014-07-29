class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :talent

  validates :user, presence: true
  validates :talent, presence: true
  validates :user, uniqueness: { scope: [:project, :talent] }

  default_scope -> { includes(:project, :talent, :user) }
  scope :my_favorites, lambda { |me| where(user: me).order(:project_id) }
  scope :my_favorites_projects, lambda { |me| my_favorites(me).group(:project_id) }

  def self.my_favorite_selected_project(user)
    my_favorites_projects(user).to_a.reject { |favorite_project| favorite_project.project.blank? }
  end

  def self.my_favorite_non_project(user)
    my_favorites(user).to_a.reject { |favorite_project| favorite_project.project.presence }
  end
end
