class ProductsPageController < ApplicationController
	protect_from_forgery

	def index
		@all_tags = Tag.all 
	end

	def each_product
		@product_id = params[:id]
		@product = Product.find_by_id(@product_id)
		@prev_rating = @product.rating
		@product.rating = @prev_rating + 1
		@product.save
		@tag_id = @product.tags_id
		@tag = Tag.find_by_id(@tag_id) 
	end

	def tag_find
		@tag_name = params[:tag]
		@tag_search = Tag.find_by_tag_name(@tag_name)
		@tag_id = @tag_search.id
		@products = Product.where(:tags_id => @tag_id).order("rating DESC")
	end

	def view_all
		# @products = Product.order("rating DESC")
		@products = Product.select("products.id, products.price, products.product_name, products.rating, products.image, tags.tag_name").from("products, tags ")
		@products = @products.where("products.tags_id=tags.id")
		@products = @products.order("rating DESC")
	end

end
