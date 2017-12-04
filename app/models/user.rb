class User < ApplicationRecord
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses, allow_destroy: true
	mount_uploader :image, ImageUploader
end
