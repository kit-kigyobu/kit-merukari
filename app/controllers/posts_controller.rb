class PostsController < ApplicationController
  include Common
  # before_action :ensure_correct_user
  #
  # def ensure_correct_user
  #   @post = Post.find_by(id: params[:id])
  #   if @post.user_id != @current_user.id
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/posts/index")
  #   end
  # end

  # def search
  #  @posts = Post.where('book_name LIKE ?', "%#{params[:search]}%")
  # end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    # @likes_count = Like.where(post_id: @post.id).count
    @category = Category.find_by(name: @post.category.name)
  end

  def new
    @post = Post.new
    @select_category = get_select_category()
  end

  def create
    @post = Post.new(
      price:params[:book_price],
      image_name1: params[:book_image1],
      image_name2: params[:book_image2],
      image_name3: params[:book_image3],
      book_name: params[:book_name],
      content: params[:content],
      user_id: @current_user.id,
      category:params[:category]
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.book_name = params[:book_name]
    @post.content = params[:content]
    @post.price = params[:book_price]
    @post.category = params[:category]

    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
