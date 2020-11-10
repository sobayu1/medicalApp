class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @user_information = UserInformation.find_or_initialize_by(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:image)
  end
end
