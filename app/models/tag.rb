class Tag < ActiveRecord::Base
	has_many :taggings, dependent: :destroy
	has_many :posts, dependent: :nullify, through: :taggings
end
