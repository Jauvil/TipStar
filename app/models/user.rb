class User < ActiveRecord::Base
  has_many :customers
  has_many :tips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_sign_up_confirmation_mail
  def send_sign_up_confirmation_mail
  	UserMailer.sign_up_confirmation(self).deliver
  end
end
