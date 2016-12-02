class CommentsController < ApplicationController

	def index
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.all.order('created_at DESC')
	end

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.save
			flash[:success] = "Comment saved"
			redirect_to post_path(@post)
		else 
			flash[:danger] = "Error has occured"
			redirect_to post_path(@post)
		end
	end

	def destroy
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		flash[:success] = "Comment deleted"
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.update(comment_params)

		if @comment.save
			flash[:success] = "Comment updated"
			redirect_to post_url(@post)
		else
			flash[:danger] = "Error occured"
			render 'edit'
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
