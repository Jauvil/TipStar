class CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
		  @customers = Customer.all.order("created_at DESC")
        else
		  render '_no_sign_in'
	    end
	end
	
	def new
		@customer = Customer.new
	end
	
	def create
		@customer = Customer.new(customer_params)
		@customer.user_id = current_user.id
		if @customer.save
			redirect_to root_path
		else 
			render 'new'
		end
	end
	
	def show
		@median_tip = @customer.median_tip(current_user.id)
		@high_tip = @customer.high_tip(current_user.id)
		@last_tip = @customer.last_tip(current_user.id)
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
        @customers = Customer.where(["address ILIKE ?", "%#{keywords}%"])
	end
    
    def search

    end



private

    def set_customer
    	@customer = Customer.find(params[:id])
    end

    def customer_params
    	params.require(:customer).permit(:address, :address_two, :city, :state, :zipcode, :user_id)
    end


	

end


