class ApplicationController < ActionController::API
    before_action :authorized
    before_action :current_user

  def current_user
    user = User.find(session[:user_id]) if session[:user_id]
  end

    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def auth_header
        # { Authorization: 'Bearer ' }
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer ' }
        begin
            JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
        rescue JWT::DecodeError
            nil
        end
        end
    end

    def current_user
        p decoded_token
        if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end