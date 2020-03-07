class ChatsController < ApplicationController

  before_action :authenticate_account!
  before_action :check_current_user

  #chat画面
  def chat
    @transaction = Transaction.find(params[:transaction_id])
    @parchase_user = User.find(@transaction.parchase_user_id)
    @exhibit_user = User.find(@transaction.exhibit_user_id)
    #閲覧者のバリデーション
    if @current_user.id != @parchase_user.id && @current_user.id != @exhibit_user.id then
      params['flash'] = "chatのメンバーではありません"
      redirect_to('/')
    end
    @chats = Chat.where(transaction_id: @transaction.id)
  end

  #chat文字送信時
  def send_chat
    #送信先があっているか
    @transaction = Transaction.find(params[:transaction_id])
    message_type = nil
    if @current_user.id == @transaction.parchase_user_id then
      message_type = Chat.message_types['parchase']
    elsif @current_user.id == @transaction.exhibit_user_id then
      message_type = Chat.message_types['exhibit']
    else
      params['flash'] = "chatのメンバーではありません"
      redirect_to('/')
    end

    @chats = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: message_type,
      message: params[:message]
    )
    @chats.save
    redirect_to("/chats/#{params[:transaction_id]}/chat")
  end

  #取引開始（chat初開講時）
  def start
    @book = Post.find(params[:book_id])
    @exhibit_user = User.find(@book.user_id)

    #id無かったりするerror処理

    @transaction = Transaction.create(
      book_id: @book.id,
      parchase_user_id: @current_user.id,
      exhibit_user_id: @exhibit_user.id,
      parchase_status: Transaction.parchase_statuses[:parchase_normal],
      exhibit_status: Transaction.exhibit_statuses[:exhibit_normal]
    )
    if !@transaction.save then
      redirect_to("/users/show/#{@current_user}")
    else
      redirect_to("/chats/#{@transaction.id}/chat")
    end
  end

  #購入側のキャンセル
  def cansel_parchase
    transaction = Transaction.find_by(id: params[:transaction_id])
    transaction.parchase_status = Transaction.parchase_statuses[:parchase_cansel]
    transaction.save
    chat = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: Chat.message_types[:parchase],
      message: "＊購入者が取引をキャンセルしました。＊"
    )
    chat.save

    redirect_to("/users/#{@current_user.id}")
  end

  #出品側のキャンセル
  def cansel_exhibit
    transaction = Transaction.find_by(id: params[:transaction_id])
    transaction.exhibit_status = Transaction.exhibit_statuses[:exhibit_cansel]
    transaction.save
    chat = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: Chat.message_types[:exhibit],
      message: "＊出品者が取引をキャンセルしました。＊"
    )
    chat.save
    redirect_to("/users/show/#{@current_user.id}")
  end

  #購入側の完了確認
  def buy_complete_comfirm
    @transaction = Transaction.find_by(id: params[:transaction_id])
  end

  #購入側の完了
  def buy_complete_comfirm_done
    @love = params['love']
    transaction = Transaction.find_by(id: params[:transaction_id])
    transaction.love += @love.to_i
    transaction.parchase_status = Transaction.parchase_statuses[:parchase_done]
    chat = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: Chat.message_types[:exhibit],
      message: "＊出品者が取引を完了しました。＊"
    )
    chat.save
    if !transaction.save then
      redirect_to("/chats/#{params[:transaction_id]}/buy_complete_comfirm")
    else
      redirect_to("/users/show/#{@current_user.id}")
    end
  end

  #出品側の完了確認
  def sale_complete_comfirm
    @transaction = Transaction.find_by(id: params[:transaction_id])
  end

  #出品側の完了
  def sale_complete_comfirm_done
    @love = params['love']
    transaction = Transaction.find_by(id: params[:transaction_id])
    transaction.love += @love.to_i
    transaction.exhibit_status = Transaction.exhibit_statuses[:parchase_done]
    chat = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: Chat.message_types[:parchase],
      message: "＊出品者が取引を完了しました。＊"
    )
    chat.save
    if !transaction.save then
      redirect_to("/chats/#{params[:transaction_id]}/buy_complete_comfirm")
    else
      redirect_to("/users/show/#{@current_user.id}")
    end
  end
end
