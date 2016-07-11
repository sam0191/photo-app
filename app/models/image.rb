class Image < ActiveRecord::Base
  belongs_to :user
  #we using carrierwave to associate the image with this model and mount uploader is the method to use
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less than 5MB")
		end
	end
end
