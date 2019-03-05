class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])

    @transactions = Transaction.where(parchase_user_id: @current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
     name: params[:name],
     email: params[:email],
     image_name: "default_user.jpg",
     password: params[:password]
   )
   if @user.save
     session[:user_id] = @user.id
     flash[:notice] = "ユーザー登録が完了しました"
     redirect_to("/users/#{@user.id}")
   else
     render("users/new")
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
