class Region < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5 }

	has_many :districts, :dependent => :destroy
	has_many :lotteries, :dependent => :destroy
end
