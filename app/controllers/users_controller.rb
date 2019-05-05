class UsersController < ApplicationController
  include Common
  # include CarrierWave::RMagick

  before_action :authenticate_account!
  before_action :check_current_user, except: [:signup, :signup_confirm, :create]


  def show
    @user = User.find_by(id: params[:id])

    #取引一覧表示用
    @parchase_transactions = Transaction
    .where(parchase_user_id: @current_user.id)
    .where(parchase_status: Transaction.parchase_statuses[:parchase_normal])
    @exhibit_transactions = Transaction
    .where(exhibit_user_id: @current_user.id)
    .where(exhibit_status: Transaction.exhibit_statuses[:exhibit_normal])
  end

  def new
    @user = User.new
  end

  def signup
    @user = User.new
    today = get_today()
    @entry_year = today.year
    @course_id = 1001

    @select_course = get_select_course()
    @select_entry_year = get_select_entry_year()
  end

  def signup_confirm
    @user = User.new
    @user.name = params[:name]
    @user.course_id = params[:course_id].to_i
    @user.entry_year = params[:entry_year].to_i
    @user_great = entry_year_to_great(@user.entry_year)
    @user.club = params[:club]
    @user.gender = params[:gender].to_i
    if params[:icon] then
      @user.icon = params[:icon]
      @user.icon.cache!
    end

    user_course = Course.find_by(course_id: @user.course_id)
    @course_name = user_course.name

    @select_course = get_select_course()
    @select_entry_year = get_select_entry_year()

    if !@user.valid? then
      render("users/signup")
    end

  end

  #新規登録実行
  def create
    @user = User.new
    @user.name = params[:name]
    @user.course_id = params[:course_id].to_i
    @user.entry_year = params[:entry_year].to_i
    @user.club = params[:club]
    @user.gender = params[:gender].to_i
    if params[:cache].present? && params[:cache][:icon].present? then
      @user.icon.retrieve_from_cache! params[:cache][:icon]
    end

    if params[:back] then
      @select_course = get_select_course()
      @select_entry_year = get_select_entry_year()
      render("users/signup")
      return
    end

    @user.account_id = @current_account_id

    if !@user.save then
      flash[:notice] = @user.errors.full_messages
      render("users/signup")
      return
    end

    flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/")


  # @user = User.new(
  #   account_id: @current_account_id,
  #   name: params[:name],
  #   gender: params[:gender_type].to_i,
  #   image_name: "default_user.jpg",
  # )
  # if @user.save
  #   session[:user_id] = @user.id
  #   flash[:notice] = "ユーザー登録が完了しました"
  #   redirect_to("/users/#{@user.id}")
  # else
  #   flash[:notice] = @user.errors.full_messages
  #   render("users/signup")
  # end
  end

  #[1]編集画面
  def edit
    @user = User.find_by(id: @current_user.id)
    @select_course = get_select_course()
    @select_entry_year = get_select_entry_year()
  end

  #[2]更新確認
  def edit_confirm
    @user = User.new
    @user.name = params[:name]
    @user.course_id = params[:course_id].to_i
    @user.entry_year = params[:entry_year].to_i
    @user_great = entry_year_to_great(@user.entry_year)
    @user.club = params[:club]
    @user.gender = params[:gender].to_i
    if params[:icon] then
      @user.icon = params[:icon]
      @user.icon.cache!
    end

    user_course = Course.find_by(course_id: @user.course_id)
    @course_name = user_course.name

    @select_course = get_select_course()
    @select_entry_year = get_select_entry_year()

    if !@user.valid? then
      render("users/edit")
    end

  end

  #[3]更新登録実行
  def update
    @user = User.find_by(id: @current_user.id)
    @user.name = params[:name]
    @user.course_id = params[:course_id].to_i
    @user.entry_year = params[:entry_year].to_i
    @user.club = params[:club]
    @user.gender = params[:gender].to_i
    if params[:cache].present? && params[:cache][:icon].present? then
      @user.icon.retrieve_from_cache! params[:cache][:icon]
    end

    #戻るボタン
    if params[:back] then #[1]へ
      @select_course = get_select_course()
      @select_entry_year = get_select_entry_year()
      render("users/edit")
      return
    end

    @user.account_id = @current_account_id

    if !@user.save then
      flash[:notice] = @user.errors.full_messages
      render("users/edit")
      return
    end

    flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/users/#{@current_user.id}")
  end
end
