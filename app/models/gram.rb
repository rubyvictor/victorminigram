class Gram < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :content, message: "not found"

	mount_uploader :image, ImageUploader

end
