class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    wrap_parameters :user, include: [:name, :email, :password, :password_confirmation]

    def create
      user = User.create(user_params)
      user.image = params[:image]
      if user.valid?
        token = encode_token({user_id: user.id})
        render json: {token: token}, status: :created
      else
        render json: user.errors, status: :not_acceptable
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      
      redirect_to account_path
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
    end
end