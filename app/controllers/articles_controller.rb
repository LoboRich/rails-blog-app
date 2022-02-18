class ArticlesController < ApplicationController
	before_action :set_article, only: %i[ show edit update destroy ]

	def index
		@articles = Article.all.order("created_at DESC")
		@article = Article.new
		@comment = Comment.new
	end

	def new
		
	end

	def show
		@comments = @article.comments.where.not(id: nil)
		@comment = @article.comments.build
		@categories = @article.categories.where.not(id: nil)
		@category = @article.categories.build
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to articles_path, notice: "Article was successfully created."
		else
			flash[:error] = "Some errors encountered"
			render :new
		end
	end

	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to articles_path, notice: "An article was successfully updated."
		else
			flash[:error] = "Some errors encountered"
			render :edit
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path, notice: "Article was successfully deleted."
	end

	private

	def set_article
		begin
			@article = Article.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			flash[:error] = e
			redirect_to new_article_path
		end
	end

	def article_params
		params.require(:article).permit(:title, :author, :content)
	end
end
