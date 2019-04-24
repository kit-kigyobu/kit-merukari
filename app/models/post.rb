class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image_name1, PictureUploader
  mount_uploader :image_name2, PictureUploader
  mount_uploader :image_name3, PictureUploader

  # def user
  #   return User.find_by(id: self.user_id)
  # end


end
