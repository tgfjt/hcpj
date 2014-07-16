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

require 'rails_helper'

RSpec.describe Talent, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
