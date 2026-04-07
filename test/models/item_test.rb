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
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
