require 'carrierwave/orm/activerecord'

class Article < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
end
