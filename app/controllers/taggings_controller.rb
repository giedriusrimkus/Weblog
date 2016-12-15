class TaggingsController < ApplicationController

	def index
		@taggings = Tagging.all.order('created_at DESC')
	end

	def destroy
		@tagging = Tagging.find(params[:id])

		if @tagging.destroy
			flash[:success] = "Tagging deleted"
			redirect_to tags_path
		else 
			flash[:danger] = "Error occured"
			redirect_to tags_path
		end
	end

end
