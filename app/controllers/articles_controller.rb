class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end
	
	def create
		article_params = params.require(:article).permit(:title, :author, :content)
		@article = Article.new(article_params)

		if @article.save
			redirect_to articles_path
		else
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		
	end
end
