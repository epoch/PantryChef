# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class UsersTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
