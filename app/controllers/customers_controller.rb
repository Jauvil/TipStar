class CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]

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

private

    def set_customer
    	@customer = Customer.find(params[:id])
    end

    def customer_params
    	params.require(:customer).permit(:address)
    end
	

end


