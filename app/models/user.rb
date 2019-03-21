class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password
  # validates :email, {presence: true, uniqueness: true}
  # validates :password, {presence: true}
  # validates :name, {presence: true}

  enum gender: { man: 0, woman: 1, other: 2}

end
