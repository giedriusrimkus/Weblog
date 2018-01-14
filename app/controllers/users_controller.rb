class UsersController < ApplicationController
	before_filter :authorize_admin, except: [:new, :create]

	def index
		@user = User.all.order('created_at DESC')
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "User updated"
			redirect_to @user
		else
			flash[:danger] = "Error updating user!"
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		if @user.destroy
			redirect_to root_url, notice: "User deleted"
        end
	end

	private
	
	def user_params
		params.require(:user).permit(:email)
	end

	
end
