class HomeController < ApplicationController

  before_action :authenticate_account!, only:[:login]

  def top
    @posts = Post.all.order(created_at: :desc)
  end

  def about
  end

  def policy
  end

  def login
    redirect_to("/home/top")
  end

  def logout
    redirect_to("/home/top")
  end
end
