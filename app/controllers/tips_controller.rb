class TipsController < ApplicationController
  before_action :set_customer, only: [:create]

	def create
		@tip = @customer.tips.create(tip_params)
		@tip.user_id = current_user.id
		
		if @tip.save
			redirect_to customer_path(@customer)
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
