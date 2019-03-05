class ChatsController < ApplicationController
  def chat
    @transaction = Transaction.find(params[:transaction_id])
    @parchase_user = User.find(@transaction.parchase_user_id)
    @exhibit_user = User.find(@transaction.exhibit_user_id)
    @chats = Chat.where(transaction_id: @transaction.id)
  end

  def send_chat
    #@typein = (params[:test_num]=="購入側")?:chat_parchase : :chat_exhibit

    @chats = Chat.create(
      transaction_id: params[:transaction_id],
      message_type: 1,#@typein,
      message: params[:message]
    )
    @chats.save
    redirect_to("/chats/#{params[:transaction_id]}/chat")
  end

  def start
    #@book = Book.find(params[:book_id])
    #@exhibit_user = @book.user

    @transaction = Transaction.create(
      book_id: 1001,#@book.id,
      parchase_user_id: @current_user.id,
      exhibit_user_id: 8,#@exhibit_user.id,
      parchase_status: :parchase_normal,
      exhibit_status: :exhibit_normal
    )
    if @transaction.save==false then
      redirect_to("/users/#{@current_user}")
    else
      redirect_to("/chats/#{@transaction.id}/chat")
    end
  end
end
