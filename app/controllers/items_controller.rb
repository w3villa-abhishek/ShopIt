class ItemsController < ApplicationController

	def index
	end

	def list
		@items = Item.all
	end
end
