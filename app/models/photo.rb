# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  photable_id        :integer
#  photable_type      :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class Photo < ActiveRecord::Base
  belongs_to :photable, polymorphic: true

  has_attached_file :image, :styles => { :medium => "300x200>", :thumb => "163x181>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
