require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
	validates :f_name, presence: true
	validates :l_name, presence: true
	validates :email, presence: true, uniqueness: true

	has_secure_password

	mount_uploader :avatar, AvatarUploader

	has_many :articles, :dependent => :destroy

	def full_name
    [f_name, l_name].join(' ')
  end
end
