class Transaction < ApplicationRecord
  enum parchase_status:{parchase_normal:0, parchase_cansel:1, parchase_done:2}
  enum exhibit_status:{exhibit_normal:0, exhibit_cansel:1, exhibit_done:2}

  has_many :chats
  belongs_to :parchase_user, class_name: 'User', :foreign_key => 'parchase_user_id'
  belongs_to :exhibit_user, class_name: 'User', :foreign_key => 'exhibit_user_id'

  def parchase_user
    return User.find_by(id: self.parchase_user_id)
  end

  def exhibit_user
    return User.find_by(id: self.exhibit_user_id)
  end
end
