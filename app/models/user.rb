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

class User < ActiveRecord::Base
	
	has_secure_password
	has_many :recipe_boxes
	has_many :recipes, through: :recipe_boxes

	validates :name, :presence => true, :uniqueness => true, length: { minimum: 3,
    too_short: "Username needs to be more than 3 characters." }
	validates_confirmation_of :password


end
