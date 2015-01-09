class User < ActiveRecord::Base
	validates :f_name, presence: true
	validates :l_name, presence: true
	validates :email, presence: true

	has_secure_password

	def full_name
    [f_name, l_name].join(' ')
  end
end
