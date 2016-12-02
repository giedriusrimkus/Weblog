class Post < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged
end
