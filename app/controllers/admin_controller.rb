class AdminController < ApplicationController
  def user
    @users = User.all.order(:id)

    @serch_id = params[:serch_id]
    @serch_name = params[:serch_name]
    @serch_email = params[:serch_email]
    @serch_club = params[:serch_club]
    @serch_gender = params[:serch_gender]
    @serch_entry_year = params[:serch_entry_year]
    @serch_ban = params[:serch_ban]
    @serch_suspend = params[:serch_suspend]
    @serch_create_data_below = params[:serch_create_data_below]
    @serch_create_data_upper = params[:serch_create_data_upper]

    if @serch_id.present? then
       @users = @users.where(id: @serch_id)
    end
    if @serch_name.present? then
       @users = @users.where("name like ?", "%"+@serch_name+"%")
    end
    if @serch_email.present? then
       @users = @users.where("email like ?", "%"+@serch_email+"%")
    end
    if @serch_club.present? then
       @users = @users.where("club like ?", "%"+@serch_club+"%")
    end
    if @serch_gender.present? then
       @users = @users.where(gender: @serch_gender)
    end
    if @serch_ban.present? then
       @users = @users.where(is_ban: @serch_ban)
    end
    if @serch_suspend.present? then
       @users = @users.where(is_suspend: @serch_suspend)
    end
    if @serch_create_data_below.present? then
       @users = @users.where("created_at >= ?",@serch_create_data_below)
    end
    if @serch_create_data_upper.present? then
       @users = @users.where("created_at <= ?",@serch_create_data_upper)
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
