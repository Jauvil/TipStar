class Tip < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user

  validates :cent, :numericality => { :greater_than_or_equal_to => 0 }
  validates :dollar, :numericality => { :greater_than_or_equal_to => 0 }

    def formatted_tip
	    if self.cent < 10
		    "$" + self.dollar.to_s + ".0" + self.cent.to_s
	    else
		    "$" + self.dollar.to_s + "." + self.cent.to_s
        end
    end

end
