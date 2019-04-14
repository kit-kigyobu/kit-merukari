class ApplicationController < ActionController::Base
  before_action :authenticate_user!

#deviseのリダイレクト設定
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
