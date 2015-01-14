class Lottery < ActiveRecord::Base
	belongs_to :district
	belongs_to :region
end