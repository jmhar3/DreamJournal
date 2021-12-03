class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:login, :fb_login]
    
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

    def fb_login
        user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.name = auth['info']['name']
            u.image = auth['info']['image']
            u.password = auth['token']
        end
        on_complete user
        token = encode_token({user_id: user.id})
        render json: {token: token}, status: :created
    end

    def destroy
        session[:user_id] = nil
    end

    private

    def auth
        request.env["omniauth.auth"]
    end

    def on_complete user
        session[:user_id] = user.id
    end
    
    def session_params
        params.permit(:email, :password)
    end
end