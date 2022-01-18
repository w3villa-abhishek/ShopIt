class ItemsController < ApplicationController

	before_action :define_price, only: [:total, :calculate_price, :total_price]

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
		mug = params[:quantity][:MUG].to_i
		tshirt = params[:quantity][:TSHIRT].to_i
		hoodie = params[:quantity][:HOODIE].to_i

		$total_price = total_price(mug,tshirt,hoodie)
		redirect_to total_path
		flash[:notice] = "Discounted price calculated successfully..."
	end

	private

		def define_price
			@mug_price = Item.find_by(code: "MUG").price
			@tshirt_price = Item.find_by(code: "TSHIRT").price
			@hoodie_price = Item.find_by(code: "HOODIE").price
		end

		def total_price(mug, tshirt, hoodie)
			mug = (mug%2==0) ? mug/2 : (mug/2)+1  
			@tshirt_price = (tshirt>2) ? @tshirt_price*0.70 : @tshirt_price
			answer = (mug*@mug_price) + 
					(tshirt*@tshirt_price) +
					(hoodie*@hoodie_price)
		end

end
