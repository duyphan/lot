class UsersController < ApplicationController
	before_action :authenticate
	before_action :can_administer?, except: [:index]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		puts "AA"
		puts params["id"]
		@user = User.find(params["id"])
	end

	def create
		@user = User.new(user_params)
		puts "AAA"
		puts user_params.inspect
    if @user.save
      redirect_to users_url, notice: 'New user created.'
    else
      render :new
    end
	end

	private
    def user_params
      params[:user].delete :admin unless current_user.try(:admin?)
      params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation, :avatar, :admin)
    end
end
