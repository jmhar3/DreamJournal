class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:login]
    
    def login
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {token: token}, status: :created
        else
          render json: user.errors, status: :unauthorized
        end
    end
end