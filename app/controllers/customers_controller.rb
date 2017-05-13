class CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
		  @customers = current_user.customers.all.order("created_at DESC")
        else
		  render '_no_sign_in'
	    end
	end
	
	def new
		@customer = current_user.customers.build
	end
	
	def create
		@customer = current_user.customers.build(customer_params)
		if @customer.save
			redirect_to root_path
		else 
			render 'new'
		end
	end
	
	def show
	    @tip_array = @customer.tips.sort_by{ |tip| [tip.dollar, tip.cent]}
		if @tip_array.count.even?
           @center = @tip_array.count / 2
           @median_tip = @tip_array[@center - 1]
        else
           @center = @tip_array.count / 2
           @median_tip = @tip_array[@center]
        end
		@high_tip = @tip_array.last
		@last_tip = @customer.tips.last
    end
	
	def edit
	end

	def update
	    if @customer.update(customer_params)
	       redirect_to customer_path
	    else
	   	   render 'edit'
	    end
	end
	
	def destroy
		@customer.destroy
		redirect_to root_path
	end

	def search_results
        keywords = params[:search_keywords]
        @results = current_user.customers.where(["address ILIKE ?", "%#{keywords}%"])
        @results.each do |r|
        	@customer = r.id
        end
	end
    
    def search

    end



private

    def set_customer
    	@customer = Customer.find(params[:id])
    end

    def customer_params
    	params.require(:customer).permit(:address)
    end


	

end


