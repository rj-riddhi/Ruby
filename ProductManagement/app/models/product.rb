class Product < ApplicationRecord

    mount_uploader :avatar, AvatarUploader
    enum status: [:active, :notactive]
end
