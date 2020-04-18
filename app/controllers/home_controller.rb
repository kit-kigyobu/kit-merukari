class HomeController < ApplicationController

  before_action :authenticate_account!, only:[:login]
  before_action :check_current_user, only: [:top]

  def top
    @posts = Post.all.order(created_at: :desc)
  end

  def about
  end

  def policy
  end

  def privacy
  end

  def login
    redirect_to("/home/top")
  end

  def logout
    redirect_to("/home/top")
  end
end
