require 'carrierwave/orm/activerecord'

class Article < ActiveRecord::Base
	validates :title, presence: true

	belongs_to :user
	mount_uploader :photo, PhotoUploader
end
