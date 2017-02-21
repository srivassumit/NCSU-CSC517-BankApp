class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]

	def index
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'Account created successfully'
			flash[:color] = 'valid'
		else
			flash[:notice] = 'Account not created'
			flash[:color] = 'invalid'
		end
		redirect_to :controller => 'sessions', :action => 'create'
	end

	# GET /users/1/edit
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		redirect_to users_path, notice: 'Profile successfully updated.'
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
