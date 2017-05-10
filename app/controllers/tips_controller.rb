class TipsController < ApplicationController

	def create
		@customer = Customer.find(params[:customer_id])
		@tip = @customer.tips.create(tip_params)
		@tip.user_id = current_user.id
		
		###DOESN'T WORK####
		#if @tip.dollar == nil
		#	@tip.dollar = 0
		#end
		
		#if @tip.cent == nil
		#	@tip.cent = 0
		#end

		if @tip.save
			redirect_to customer_path(@customer)
		else
			render 'new'
		end
		
	end

	private

	def tip_params
		params.require(:tip).permit(:dollar, :cent)
	end

end
