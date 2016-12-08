class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
	validates :post_attachments, presence: false

	extend FriendlyId
	friendly_id :title, use: :slugged

	def next
   	 Post.where("id > ?", id).limit(1).first
  	end

  	def prev
    	Post.where("id < ?", id).limit(1).first
  	end

  	has_many :post_attachments
   	accepts_nested_attributes_for :post_attachments
end
