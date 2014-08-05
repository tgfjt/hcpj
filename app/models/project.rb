class Project < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :talents, through: :favorites

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  default_scope -> { includes :user }
  scope :my_project, lambda { |my| where(user: my) }
  scope :selectable_my_project, lambda { |user| my_project(user).where("start_date <= ? and end_date >= ?", Date.today, Date.today) }
end
