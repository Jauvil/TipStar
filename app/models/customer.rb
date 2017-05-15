class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :tips

	validates :address, uniqueness: { scope: :city }

end
