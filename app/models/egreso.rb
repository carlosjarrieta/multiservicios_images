# == Schema Information
#
# Table name: egresos
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Egreso < ApplicationRecord
  mount_uploader :image, ItemImageUploader
  validates_presence_of :image, message: "no puede estar en blanco"
end
