# == Schema Information
#
# Table name: recipe_boxes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  recipe_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class RecipeBoxesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
