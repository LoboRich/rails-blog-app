class Article < ApplicationRecord
	 validates :title, :author, :content, presence: true
	 validates :title, uniqueness: {scope: 'title', message: 'Title Should be unique'}
	 has_many :comments
	 has_and_belongs_to_many :categories


	#  before_validation :set_content, if: :content_is_empty?

	#  def set_content
	#  	self.content = 'Default Content'
	#  end

	#  def content_is_empty?
	#  	self.content.blank? .nil?
	#  end

	#  def create_comment
	# 	Comment.create(content: "Yows", article: self)
	#  end
end
