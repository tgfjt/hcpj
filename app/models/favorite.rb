class Favorite < ActiveRecord::Base
  belongs_to :project
  belongs_to :talent

  validates :project, uniqueness: { scope: :talent }
end
