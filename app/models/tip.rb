class Tip < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user

  validates_numericality_of :cent
  validates_numericality_of :dollar



  
end
