class TagsController < ApplicationController
	before_filter :authorize_admin
	
	def index
		@tags = Tag.all.order('created_at DESC')
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		if @tag.save
			flash[:success] = "Tag deleted"
			redirect_to tags_path
		else 
			flash[:danger] = "Error occured"
			redirect_to tags_path
		end
	end

end