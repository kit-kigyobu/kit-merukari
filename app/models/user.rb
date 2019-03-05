class User < ApplicationRecord
  has_secure_password
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  validates :name, {presence: true}

  enum gender: { man: 1, woman: 2, other: 3}

end
