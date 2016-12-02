class PostsController < ApplicationController

def index
	@post = Post.all.order('created_at DESC')
end

def new
	@post = Post.new
end

def create
	@post = Post.new(post_params)
	if @post.save
			flash[:notice] = "Post created"
			redirect_to @post
	else
		flash[:alert] = "Error creating new post!"
		render :new
	end
end

def edit
	@post = Post.friendly.find(params[:id])
end

def update
	@post = Post.friendly.find(params[:id])
	if @post.update(post_params)
		flash[:notice] = "Post updated"
		redirect_to @post
	else
		flash[:alert] = "Error updating post!"
		render :edit
	end
end

def show
	@post = Post.friendly.find(params[:id])
end

def destroy
	@post = Post.friendly.find(params[:id])
	@post.destroy
	flash[:notice] = "Post deleted"
	redirect_to posts_path
end

private

def post_params
	params.require(:post).permit(:title, :body)
end

end
