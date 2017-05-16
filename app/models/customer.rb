class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :tips

	validates :address, uniqueness: { scope: :city }


    #Get the median tip of a customer where customer_id corresponds with self and user_id corresponds with argument
    def user_median_tip(user_id)
        tip_array = self.sorted_user_customer_tips(user_id)
		center = tip_array.count / 2
		if tip_array.count.even?
            median_tip = tip_array[center - 1]
        else
            median_tip = tip_array[center]
        end
        median_tip
    end

    #Get the highest tip of a customer where customer_id corresponds with self and user_id corresponds with argument
    def user_high_tip(user_id)
            tip_array = self.sorted_user_customer_tips(user_id)
    	    high_tip = tip_array.last
         	high_tip
    end

    #Get the last tip of a customer where customer_id corresponds with self and user_id corresponds with argument
    def user_last_tip(user_id)
    	self.tips.where(user_id: user_id).last
    end

    #Get a list of all tips where customer_id corresponds with self and user_id corresponds with argument
    #Sort list by value
    def sorted_user_customer_tips(user_id)
        user_customer_tips = self.tips.where(user_id: user_id)
        user_customer_tips.sort_by{ |tip| [tip.dollar, tip.cent] }
    end

    #Street address of customer in string type
    def street_address
        self.address.to_s + self.address_two.to_s
    end
    
    #City, State, Zipcode of customer in string type
    def city_state_zip
        self.city.to_s + ", " + self.state.to_s + " " + self.zipcode
    end

    #Get a list of all tips where customer_id corresponds with self. Sort list by value
    def sorted_customer_tips
        customer_tips = self.tips
        customer_tips.sort_by{ |tip| [tip.dollar, tip.cent] }
    end
    
    #Call for the median tip of all tips where customer_id corresponds with self
    def customer_median_tip
        tip_array = self.sorted_customer_tips
        center = tip_array.count / 2
        if tip_array.count.even?
            customer_median_tip = tip_array[center - 1]
        else
            customer_median_tip = tip_array[center]
        end
        customer_median_tip
    end



end
