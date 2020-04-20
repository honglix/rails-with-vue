class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @user = User.all

    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :post_time)
    end
end
