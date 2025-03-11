class ApplicationController < ActionController::API
  # 1. Call authorize_request before every controller action by default
  before_action :authorize_request
  
  # 2. This method checks if the request is authorized
  def authorize_request
    header = request.headers['Authorization']              # e.g. "Bearer <token>"
    token = header.split(' ').last if header               # extract <token>
    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      @current_user = User.find(decoded['user_id'])        # find user in DB
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
  
  # 3. Helper method so we can reference @current_user anywhere
  def current_user
    @current_user
  end
end
