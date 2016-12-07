class PostsController < ApplicationController

# before_action :authenticate_user!, except: [:index, :show]
before_filter :authorize_admin, except: [:index, :show]

def index
	@post = Post.all.order('created_at DESC')
end

def new
	@post = Post.new
end

def create
	@post = Post.new(post_params)
	if @post.save
			flash[:success] = "Post created"
			redirect_to @post
	else
		flash[:danger] = "Error creating new post!"
		render :new
	end
end

def edit
	@post = Post.friendly.find(params[:id])
end

def update
	@post = Post.friendly.find(params[:id])
	if @post.update(post_params)
		flash[:success] = "Post updated"
		redirect_to @post
	else
		flash[:danger] = "Error updating post!"
		render :edit
	end
end

def show
	@post = Post.friendly.find(params[:id])
end

def destroy
	@post = Post.friendly.find(params[:id])
	@post.destroy
	flash[:success] = "Post deleted"
	redirect_to posts_path
end

def publish
	@post = Post.friendly.find(params[:id])
	@post.published = true
	if @post.save
		redirect_to @post
		flash[:success] = "Post published"
	else
		flash[:alert] = "Error occured"
		redirect_to @post
	end
end

def unpublish
	@post = Post.friendly.find(params[:id])
	@post.published = false
	@post.save
	if @post.save
		redirect_to @post
		flash[:success] = "Post unpublished"
	else
		flash[:alert] = "Error occured"
		redirect_to @post
	end
end

private

def post_params
	params.require(:post).permit(:title, :body, :published)
end

end
