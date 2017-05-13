class Tip < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user

  validates :cent, :numericality => { :greater_than_or_equal_to => 0 }
  validates :dollar, :numericality => { :greater_than_or_equal_to => 0 }

  
end
