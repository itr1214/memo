class Api::UsersController < ApplicationController
	protect_from_forgery except: :create
    skip_before_action :authenticate_user_from_token!, only: [:create, :update]
	# before_action :authenticate_user!
	

    def index
      render json: User.all, each_serializer: Api::UserSerializer
    end

    # POST
    # Create an user
    def create
        # binding.pry
      @user = User.new user_params
      # binding.pry

      if @user.save!
        render json: @user, serializer: Api::SessionSerializer, root: nil
      else
        render json: { error: t('user_create_error') }, status: :unprocessable_entity
      end
    end

    def update
    	# binding.pry
    	@user = User.where("access_token = ?", token_params["access_token"])
    	# binding.pry
    	
    	if @user.update(update_params)
    		# render json: @user, serializer: Api::SessionSerializer, root: nil
    		render json: @user
    	else
    		render json: { error: t('user_create_error') }, status: :unprocessable_entity	
    	end

    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def update_params
		params.require(:user).permit(:email, :name)
    end

    def token_params
    	params.require(:user).permit(:access_token)
    end
end
