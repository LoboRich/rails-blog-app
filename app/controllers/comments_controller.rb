class CommentsController < ApplicationController
	before_action :set_article
	before_action :set_comment, only: [:edit, :update, :destroy]
	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def show
	end

	def create
		@comment = @article.comments.build(comment_params)

		if @comment.save
			redirect_to @article, notice: "Comment was successfully created."
		else
			@comments = @article.comments
			render "articles/show"
		end
	end

	def edit
		@comment = Comment.find(params[:id])
		@article =  Article.find(params[:article_id])
	end

	def update
		if @comment.update(comment_params)
			redirect_to @article, notice: "A comment was successfully updated."
		else
			flash[:error] = "Some errors encountered"
			render :edit
		end
	end

	def destroy
		@comment.destroy
		redirect_to @article, notice: "Comment was successfully deleted."
	end

	private

	def set_article
		@article = Article.find(params[:article_id])
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end
end
