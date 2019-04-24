class User < ApplicationRecord
  has_many :post
  # 投稿とのアソシエーション

  mount_uploader :icon, PictureUploader

  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  validates :name, {presence: true}

  enum gender: { man: 0, woman: 1, other: 2}

end
