module AdditionalHelper

	def get_item_price_by_code(code)
		Item.find_by(code: code).price
	end

	def calculate_total_price(hash)
		hash.keys.map { |key| get_item_price_by_code(key) * hash[key].to_i }.sum
	end

	def discount_on_price(hash)
		discount_on_tshirt = get_item_price_by_code("TSHIRT")*0.30*hash[:TSHIRT].to_i if hash[:TSHIRT].to_i>2
		discount_on_mug = get_item_price_by_code("MUG") if hash[:MUG].to_i > 1
		discount_on_mug.to_i + discount_on_tshirt.to_i
	end
end