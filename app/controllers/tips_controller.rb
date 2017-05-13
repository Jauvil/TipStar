class TipsController < ApplicationController
  before_action :set_customer, only: [:create]
  before_action :authenticate_user!

	def create
		@tip = @customer.tips.create(tip_params)
		@tip.user_id = current_user.id
		if @tip.dollar == nil
			@tip.dollar = 0
		end
		if @tip.cent == nil 
			@tip.cent = 0
		end
		
		if @tip.save
			redirect_to customer_path(@customer)
		else 
			render 'tips/_form'

		end
		
	end

	private

	def tip_params
		params.require(:tip).permit(:dollar, :cent)
	end

	def set_customer
		@customer = Customer.find(params[:customer_id])
	end

end
