
	class Api::CustomersController < ApplicationController
		respond_to :json

		def index
			respond_with Customer.all
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
