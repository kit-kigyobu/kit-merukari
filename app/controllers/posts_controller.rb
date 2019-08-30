class PostsController < ApplicationController
  include Common

  before_action :authenticate_account!
  before_action :check_current_user

  def search

    @posts = Post.all
    if params['search_word'].present? then      @posts = @posts.where("name LIKE ?", "%"+params['search_word']+"%");    @search_word      = params['search_word'] end
    if params['search_class'].present? then     @posts = @posts.where("class LINE ?", "%"+params['search_class']+"%");  @search_class     = params['search_class'] end

    if params['search_price_up'].present? then  @posts = @posts.where("price <= ?", params['search_price_up'].to_i);    @search_price_up  = params['search_price_up'].to_i end
    if params['search_price_low'].present? then @posts = @posts.where("price >= ?", params['search_price_low'].to_i);   @search_price_low = params['search_price_low'].to_i end
    if params['search_category'].present? then
      if params['search_category'] >= 0 then
        @posts = @posts.where("category_id = ?", params['search_category']);    @search_category = params['search_category'].to_i
      else
        @search_category  = -1
      end
    end

    @select_category = get_select_category_with_blank()
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

  def chat_confirm
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
      flash[:notice] = "必須の欄が記入できている、間違いがないかお確かめください。"
      @errors_full_messages = @post.errors.full_messages
      @select_category = get_select_category()
      render("/posts/new")
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
