class User < ApplicationRecord
  has_many :posts
  # 投稿とのアソシエーション

  mount_uploader :icon, PictureUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,length: { maximum: 255 },
                              format{with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true,length: { maximum: 50 }

  enum gender: { man: 0, woman: 1, other: 2}

end
