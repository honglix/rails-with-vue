class Api::V1::UsersController < ApplicationController

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
