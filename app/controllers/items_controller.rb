class ItemsController < ApplicationController

include AdditionalHelper


	def home
	end

	def list
		@items = Item.all
	end

	def price
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(params.require(:item).permit(:price))
			redirect_to items_path	
			flash[:notice] = "Price updated successfully"
		else
			render 'edit'
		end
	end

	def total
		@price = calculate_total_price(params[:quantity])
		if(params[:quantity][:MUG].to_i > 1 || params[:quantity][:TSHIRT].to_i >2)
			flash.now[:notice] = "Congratulations! You're eligible for discounts..."
			@discounted_price = @price-discount_on_price(params[:quantity])
		end
	end

end
