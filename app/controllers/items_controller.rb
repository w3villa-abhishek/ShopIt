class ItemsController < ApplicationController

	before_action :define, only: [:total, :calculate_price]

	def home
	end

	def list
		@items = Item.all
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

	def price
	end

	def total
	end

	def calculate_price
		$total_price = ((params[:quantity][:MUG].to_i*@mug_price) + 
						(params[:quantity][:TSHIRT].to_i*@tshirt_price) +
						(params[:quantity][:HOODIE].to_i*@hoodie_price))
		redirect_to total_path
		flash[:notice] = "price calculated successfully..."
	end

	private

		def define
			@mug_price = Item.find_by(code: "MUG").price
			@tshirt_price = Item.find_by(code: "TSHIRT").price
			@hoodie_price = Item.find_by(code: "HOODIE").price
		end

end
