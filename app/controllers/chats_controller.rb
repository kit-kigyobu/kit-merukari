class ChatsController < ApplicationController
  #chat画面
  def chat
    @transaction = Transaction.find(params[:transaction_id])
    @parchase_user = User.find(@transaction.parchase_user_id)
    @exhibit_user = User.find(@transaction.exhibit_user_id)
    @chats = Chat.where(transaction_id: @transaction.id)
  end

  #chat文字送信時
  def send_chat
    @chats = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: params[:message_type].to_i,
      message: params[:message]
    )
    @chats.save
    redirect_to("/chats/#{params[:transaction_id]}/chat")
  end

  #chat初開講時
  def start
    #@book = Book.find(params[:book_id])
    #@exhibit_user = @book.user

    @transaction = Transaction.create(
      book_id: 1001,#@book.id,
      parchase_user_id: @current_user.id,
      exhibit_user_id: params[:exhibit_user_id].to_i,
      parchase_status: Transaction.parchase_statuses[:parchase_normal],
      exhibit_status: Transaction.exhibit_statuses[:exhibit_normal]
    )
    if !@transaction.save then
      redirect_to("/users/#{@current_user}")
    else
      redirect_to("/chats/#{@transaction.id}/chat")
    end
  end

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
    redirect_to("/users/#{@current_user.id}")
  end

  def buy_complete_comfirm
    @transaction = Transaction.find_by(id: params[:transaction_id])
  end

  def buy_complete_comfirm_done
    @love = param['love']
    transaction = Transaction.find_by(id: params[:transaction_id])
    transaction.love += @love.to_i
    if !transaction.save then
      redirect_to("/chats/#{params[:transaction_id]}/buy_complete_comfirm")
    else
      redirect_to("/users/#{@current_user.id}")
    end
  end
end
