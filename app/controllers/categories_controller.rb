class CategoriesController < ApplicationController
	before_action :set_article

	def create
		@category = @article.categories.build(category_params)
		@article.categories << @category
		if @category.save
			redirect_to @article, notice: "Category was successfully created."
		else
			@category = @article.categories
			render "articles/show"
		end
	end

	private

	def set_article
		@article = Article.find(params[:article_id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

end
