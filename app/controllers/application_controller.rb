class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_account_id = current_account.id
    @current_user = User.find_by(account_id: @current_account_id)
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/")
    end
  end

#deviseのリダイレクト設定
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
