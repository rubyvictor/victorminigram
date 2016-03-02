class Gram < ActiveRecord::Base
	validates_presence_of :title, :content, message: "not found"

	mount_uploader :image, ImageUploader

end
