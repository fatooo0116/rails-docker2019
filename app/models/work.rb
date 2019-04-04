class Work < ApplicationRecord
  belongs_to :user

  mount_uploader :pimg, PimgUploader
end
