class Region < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 10 }
end
