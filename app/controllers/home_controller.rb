class HomeController < ApplicationController

  before_action :authenticate_account!

  def top
    @posts = Post.all.order(created_at: :desc)
  end

  def about
  end

  def policy
  end

end
