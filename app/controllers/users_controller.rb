class UsersController < ApplicationController
  before_action :authenticate_user!

  # require 'happybirthday'

  def show
    @user = current_user
    # birthday = Happybirthday.born_on(current_user.birth_date)
    # @birthday = birthday.age.years_old
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
