class User < ApplicationRecord
  belongs_to :account
  belongs_to :course
  has_many :posts
  has_many :parchase_transactions, class_name: 'Transaction', :foreign_key => 'parchase_user_id'
  has_many :exhibit_transactions, class_name: 'Transaction', :foreign_key => 'exhibit_user_id'
  # 投稿とのアソシエーション

  mount_uploader :icon, PictureUploader

  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}
  #validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true,length: { maximum: 50 }

  enum gender: { man: 0, woman: 1, other: 2}

end
