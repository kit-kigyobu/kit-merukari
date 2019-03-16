class AdminController < ApplicationController
  def user
    @users = User.all.order(:id)

    if params[:serch_id].present? then
       @users = @users.where(id: params[:serch_id])
    end
    if params[:serch_name].present? then
       @users = @users.where("name like ?", "%"+params[:serch_name]+"%")
    end


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
