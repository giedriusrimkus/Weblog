class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :nullify
  has_many :tags, dependent: :nullify, through: :taggings

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
  end

  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

 def next
 	 Post.where("id > ?", id).limit(1).first
	end

	def prev
  	Post.where("id < ?", id).limit(1).first
	end

	has_many :post_attachments
 	accepts_nested_attributes_for :post_attachments
end
