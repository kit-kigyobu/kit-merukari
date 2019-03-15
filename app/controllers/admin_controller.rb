class AdminController < ApplicationController
  def user
    @users = User.all.order(:id)
  end

  def userBan
    @user = User.find(params[:user_id])
    @user.is_ban = !@user.is_ban
    @user.save
    redirect_to("/admin/user")
  end

  def post
  end

  def transaction
    @transactions = Transaction.all
  end
end
