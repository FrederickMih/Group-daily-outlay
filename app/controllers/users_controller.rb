class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
   @user = current_user
   return if user_signed_in?

   flash[:danger] ['Access Denied. Please Login First']
   redirect_to root_url

  end





  private

  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password )
  end


end
