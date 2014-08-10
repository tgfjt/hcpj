# == Schema Information
#
# Table name: talents
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  firstname              :string(255)
#  lastname               :string(255)
#  area                   :string(255)
#  country                :string(255)
#  sex                    :string(255)
#  age                    :integer
#  nationality            :string(255)
#  mainimage_file_name    :string(255)
#  mainimage_content_type :string(255)
#  mainimage_file_size    :integer
#  mainimage_updated_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

class Talent < ActiveRecord::Base
  has_many :favorites
  has_many :projects, through: :favorites
  accepts_nested_attributes_for :favorites, allow_destroy: true

  has_many :photos, as: :photable
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  has_attached_file :mainimage, :styles => { large: "300x400", medium: "300x200>", thumb: "163x181>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :mainimage, :content_type => /\Aimage\/.*\Z/

  validates :age, numericality: true
  validates :height_feet, numericality: true
  validates :height_inch, numericality: true

  # enum sex: [:male, :female] unless instance_methods.include? :sex
  enum sex: { male: 0, female: 1 }

  def my_favorite_talent?(user)
    Favorite.where(user: user, talent: self).exists?
  end

  def my_favorite_self(user)
    Favorite.where(user: user, talent: self).order(:project_id)
  end

  @@max_images = 5
  def build_images
    (@@max_images - self.photos.size).times { self.photos.build }
  end

  def image_delete
    @mainimage_delete ||= "0"
  end

  def image_delete=(value)
    @mainimage_delete = value
  end

  private
  def destroy_mainimage?
    self.mainimage.destroy if @mainimage_delete == "1"
  end

end
