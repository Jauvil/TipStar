class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :tips

	validates :address, uniqueness: { scope: :city }


    def median_tip(user_id = nil)
        tip_array = self.sorted_customer_tips(user_id)
		center = tip_array.count / 2
		if tip_array.count.even?
            median_tip = tip_array[center - 1]
        else
            median_tip = tip_array[center]
        end
        median_tip
    end

    def high_tip(user_id = nil)
            tip_array = self.sorted_customer_tips(user_id)
    	    high_tip = tip_array.last
         	high_tip
    end

    def last_tip(user_id = nil)
    	self.tips.where(user_id: user_id).last
    end

    def sorted_customer_tips(user_id = nil)
        customer_tips = self.tips.where(user_id: user_id)
        customer_tips.sort_by{ |tip| [tip.dollar, tip.cent] }
    end

    def street_address
        self.address.to_s + self.address_two.to_s
    end
    
    def city_state_zip
        self.city.to_s + ", " + self.state.to_s + " " + self.zipcode
    end
end
