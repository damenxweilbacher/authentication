class UsersController < ApplicationController
  
  def create
    user = User.create!(name: "damen", email: "damen@damen.com", password: "123456")
    render json: user
  end 

  def index
    users = User.all 
    render json: users
    puts @current_user.email
  end

  include Pundit
  # Rescue from Pundit errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.'}, status: :forbidden
  end
end
