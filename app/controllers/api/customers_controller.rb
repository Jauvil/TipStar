
	class Api::CustomersController < ApplicationController
		respond_to :json

		def index
			address = params[:address]
			respond_with Customer.where("address ILIKE ?", "%#{address}%")
		end

		def create
		end

		def show
			respond_with Customer.find(params[:id])
		end

		def update
		end

		def delete
		end


	end
