class ProductController < ApplicationController
# p = Product.new(:name=>'IPhone', :price=>49000.99, :quantity=>1000, :pic=>'/images/iphone.png')
# p = Product.new(:name=>'S5', :price=>51000.99, :quantity=>100, :pic=>'/images/s5.png')
# p = Product.new(:name=>'Nexus', :price=>28000.99, :quantity=>100, :pic=>'/images/nexus.png')

	def index
		@loggedin = false
		@products = Product.all

	end

	def show
		@product = Product.find(params[:id])
	end

	def buy
		if !user_signed_in?
			flash[:danger] = "Please Login to Buy"
			redirect_to signin_path

		else

			@product = Product.find(params[:id])
		end
	end

end
