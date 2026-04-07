# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  image_url   :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
    mount_uploader :image_url, ItemImageUploader
    validates :title, :description, :image_url, presence: true
end
