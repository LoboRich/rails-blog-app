class Article < ApplicationRecord
	 validates :title, :author, :content, presence: true
	 validates :title, uniqueness: {scope: 'title', message: 'Title Should be unique'}
	 has_many :comments
	 has_and_belongs_to_many :categories
end
