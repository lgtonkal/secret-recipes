class ApplicationController < ActionController::API

    def not_found
        render json: { error: 'not_found'}
    end

    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        
        begin
            json_token = JsonWebToken.new
            @decoded = json_token.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
    end
end
