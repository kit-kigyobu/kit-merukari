class ApplicationController < ActionController::Base

  before_action :set_current_account_id
  before_action :set_current_user

  def set_current_account_id
    if current_account then
      @current_account_id = current_account.id
    end
  end

  #
  def set_current_user
    if @current_account_id then
      @current_user = User.find_by(account_id: @current_account_id)
    end
  end

  def check_current_user
    if !@current_user then
      redirect_to("/signup3")
    end
  end

  #
  # def authenticate_user
  #   if @current_user == nil
  #     flash[:notice] = "ログインが必要です"
  #     redirect_to("/login")
  #   end
  # end
  #
  # def forbid_login_user
  #   if @current_user
  #     flash[:notice] = "すでにログインしています"
  #     redirect_to("/")
  #   end
  # end

#deviseのリダイレクト設定
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
