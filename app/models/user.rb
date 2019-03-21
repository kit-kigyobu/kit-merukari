class User < ApplicationRecord
  # validates :email, {presence: true, uniqueness: true}
  # validates :password, {presence: true}
  # validates :name, {presence: true}

  enum gender: { man: 0, woman: 1, other: 2}

end
