class District < ActiveRecord::Base
	belongs_to :region
	has_many :lotteries, :dependent => :destroy
end
