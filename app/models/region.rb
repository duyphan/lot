class Region < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5 }

	has_many :districts, :dependent => :destroy
end
