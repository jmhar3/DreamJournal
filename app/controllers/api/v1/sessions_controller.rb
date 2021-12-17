class Api::V1::SessionsController < ApplicationController
    skip_before_action :authorized, only: [:login]
    
    def login
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
            on_complete user
            token = encode_token({user_id: user.id, user_name: user.name})
            render json: {token: token}, status: :created
        else
          render json: user.errors, status: :unauthorized
        end
    end

    def logout
        p session.inspect
        session[:user_id] = nil
    end

    private

    def on_complete user
        session[:user_id] = user.id
    end
    
    def session_params
        params.permit(:email, :password)
    end
end