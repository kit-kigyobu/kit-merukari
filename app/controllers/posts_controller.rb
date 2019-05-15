class PostsController < ApplicationController
  include Common

  def search
    if !params['search_word'] then
      @posts = Post.all
    else
      @posts = Post.where()
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @exhibit_user = User.find(@post.user_id)
    category = Category.find_by(category_id: @post.category_id)
    @user_great = entry_year_to_great(@exhibit_user.entry_year)
    user_course = Course.find_by(course_id: @exhibit_user.course_id)
    @course_name = user_course.name
    @category_name = category.name
  end

  def new
    @post = Post.new
    @select_category = get_select_category()
  end

  def create_confirm

    @post = Post.new(
      price: params[:price],
      author: params[:author],
      class_name: params[:class_name],
      image_name1: params[:image_name1],
      image_name2: params[:image_name2],
      image_name3: params[:image_name3],
      name: params[:name],
      content: params[:content],
      user_id: @current_user.id,
      category_id: params[:category_id]
    )

    post_category = Category.find_by(category_id: @post.category_id)
    @category_name = post_category.name

    if params[:image1] then
      @post.image_name1 = params[:image1]
      @post.image_name1.cache!
    end
    if params[:image2] then
      @post.image_name2 = params[:image2]
      @post.image_name2.cache!
    end
    if params[:image3] then
      @post.image_name3 = params[:image3]
      @post.image_name3.cache!
    end

    if !@post.valid? then
      flash[:notice] = "投稿失敗"
      @errors_full_messages = @post.errors.full_messages
      @select_category = get_select_category()
      redirect_to("/posts/new")
    end
  end

  def create
    @post = Post.new(
      price: params[:price],
      author: params[:author],
      class_name: params[:class_name],
      name: params[:name],
      content: params[:content],
      user_id: @current_user.id,
      category_id: params[:category_id]
    )
    if params[:cache].present? && params[:cache][:image_name1].present? then
      @post.image_name1.retrieve_from_cache! params[:cache][:image_name1]
    end
    if params[:cache].present? && params[:cache][:image_name2].present? then
      @post.image_name2.retrieve_from_cache! params[:cache][:image_name2]
    end
    if params[:cache].present? && params[:cache][:image_name3].present? then
      @post.image_name3.retrieve_from_cache! params[:cache][:image_name3]
    end

    #戻るボタン
    if params[:back] then #[1]へ
      @select_category = get_select_category()
      render("posts/new")
      return
    end

    if @post.save then
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/show/#{@post.id}")
    else
      @errors_full_messages = @post.errors.full_messages
      @select_category = get_select_category()
      render("posts/new")
    end
  end

  def edit
    @post_id = params[:id]
    @post = Post.find(params[:id])
    @select_category = get_select_category()
  end

  def edit_confirm
    @post_id = params[:id]
    @post = Post.new(
      price: params[:price],
      author: params[:author],
      class_name: params[:class_name],
      image_name1: params[:image_name1],
      image_name2: params[:image_name2],
      image_name3: params[:image_name3],
      name: params[:name],
      content: params[:content],
      user_id: @current_user.id,
      category_id: params[:category_id]
    )

    post_category = Category.find_by(category_id: @post.category_id)
    @category_name = post_category.name

    if params[:image1] then
      @post.image_name1 = params[:image1]
      @post.image_name1.cache!
    end
    if params[:image2] then
      @post.image_name2 = params[:image2]
      @post.image_name2.cache!
    end
    if params[:image3] then
      @post.image_name3 = params[:image3]
      @post.image_name3.cache!
    end

    if !@post.valid? then
      flash[:notice] = "投稿失敗"
      @errors_full_messages = @post.errors.full_messages
      @select_category = get_select_category()
      redirect_to("/posts/edit/#{@params_id}")
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.price = params[:price]
    @post.author = params[:author]
    @post.class_name = params[:class_name]
    @post.name = params[:name]
    @post.content = params[:content]
    @post.user_id = @current_user.id
    @post.category_id = params[:category_id]

    if params[:cache].present? && params[:cache][:image_name1].present? then
      @post.image_name1.retrieve_from_cache! params[:cache][:image_name1]
    end
    if params[:cache].present? && params[:cache][:image_name2].present? then
      @post.image_name2.retrieve_from_cache! params[:cache][:image_name2]
    end
    if params[:cache].present? && params[:cache][:image_name3].present? then
      @post.image_name3.retrieve_from_cache! params[:cache][:image_name3]
    end

    #戻るボタン
    if params[:back] then #[1]へ
      @select_category = get_select_category()
      render("posts/edit/#{@post_id}")
      return
    end

    if @post.update then
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/show/#{@post.id}")
    else
      @errors_full_messages = @post.errors.full_messages
      @select_category = get_select_category()
      render("posts/edit/#{@post_id}")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
