class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :tips

	validates :address, uniqueness: { scope: :city }


    def median_tip(user_id)
    	tip_array = self.sorted_customer_tips(user_id)
		center = tip_array.count / 2
		if tip_array.count.even?
           median_tip = tip_array[center - 1]
        else
           median_tip = tip_array[center]
        end
        median_tip
    end

    def high_tip(user_id)
        tip_array = self.sorted_customer_tips(user_id)
    	high_tip = tip_array.last
    	high_tip
    end

    def last_tip(user_id)
    	self.tips.where(user_id: user_id).last
    end

    def sorted_customer_tips(user_id)
    	customer_tips = self.tips.where(user_id: user_id)
    	customer_tips.sort_by{ |tip| [tip.dollar, tip.cent] }
    end

    def self.formatted_price
    	if self.cent < 10
    	    self.cent = "0" + self.cent.to_s
    	else 
    		self.cent = self.cent
    	end
    end

end
