class IndexController < ApplicationController

  def index
    #hihihi
    if request.post? then
      @title = "RESULT"
      @main_text = "you typed : " + params['name']
      @value = params['name']
    else
      @title = "Index"
      @main_text = "type text, please"
      @value = ''
    end
  end

  def chatani
    redirect_to action: :index, params: {'name': 'chatani sota'}
  end

end
