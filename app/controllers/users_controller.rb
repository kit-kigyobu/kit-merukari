class UsersController < ApplicationController

  require "date"

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

  def signup3
    @user = User.new
    @entry_year = 2016
    @course_id = 1001

    @select_course = Hash.new
    courses = Course.all
    courses.each do |course|
      @select_course.store(course.name,course.course_id)
    end

    today = Date.today
    nowyear = (today.month<=3)?(today.year-1):(today.year)
    @select_entry_year = [
      ['学部1回生',nowyear],['学部2回生',nowyear-1],['学部3回生',nowyear-2],['学部4回生',nowyear-3],
      ['修士1回生',nowyear-4],['修士2回生',nowyear-5],['博士以上',nowyear-6],
    ]
  end

  def signup4
    @user = User.new
    @user.name = params[:name]
    @user.course_id = params[:course_id].to_i
    @user.entry_year = params[:entry_year].to_i
    @user.club = params[:club]
    @user.gender = params[:gender].to_i

    user_course = Course.find_by(course_id: @user.course_id)
    @course_name = user_course.name


    @select_course = Hash.new
    courses = Course.all
    courses.each do |course|
      @select_course.store(course.name,course.course_id)
    end

    today = Date.today
    nowyear = (today.month<=3)?(today.year-1):(today.year)
    @select_entry_year = [
      ['学部1回生',nowyear],['学部2回生',nowyear-1],['学部3回生',nowyear-2],['学部4回生',nowyear-3],
      ['修士1回生',nowyear-4],['修士2回生',nowyear-5],['博士以上',nowyear-6],
    ]

    if !@user.valid? then
      render("users/signup3")
    end



  end

  def create
   @user = User.new(
     account_id: @current_account_id,
     name: params[:name],
     gender: params[:gender_type].to_i,
     image_name: "default_user.jpg",
   )
   if @user.save
     session[:user_id] = @user.id
     flash[:notice] = "ユーザー登録が完了しました"
     redirect_to("/users/#{@user.id}")
   else
     flash[:notice] = @user.errors.full_messages
     render("users/signup3")
   end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.content = params[:content]
    @user.club = params[:club]
    @user.entry_year = params[:entry_year]


    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
      flash[:notice] = "編集できていません"
    end

  end


  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

end
