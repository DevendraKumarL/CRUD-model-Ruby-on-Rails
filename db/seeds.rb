# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.create(tag_name: "shirt")
Tag.create(tag_name: "jeans")
Tag.create(tag_name: "shoes")
Tag.create(tag_name: "wallets")


Product.create(tags_id: 1, product_name: "Checks Shirt", image: "/checks-shirt.jpg", info: "100% cotton yarn dyed fashion check |
 Tapered fit | Fashion collar | Mitred corner detail on cuffs | Stitching detail on collar edge and cuff edge |
  Single breast pocket", 
	price: 500, rating: 0)
Product.create(tags_id: 1, product_name: "Casual Shirt", image: "/casual-shirt.jpg", info: "Nautical classics get a cool twist to
navigate spring's seafaring trend.", 
	price: 1000, rating: 0)

Product.create(tags_id: 2, product_name: "Casual Jeans", image: "/jeans1.jpg", info: "Ben Martin Regular Fit Men's Jeans", 
	price: 900, rating: 0)
Product.create(tags_id: 2, product_name: "Denim Jeans", image: "/jeans2.jpg", info: "Stylox Slim Fit Men's Jeans", 
	price: 1500, rating: 0)

Product.create(tags_id: 3, product_name: "Casual Shoes", image: "/shoes1.jpg", info: "Stylox Slim Fit Men's Jeans", 
	price: 500, rating: 0)
Product.create(tags_id: 3, product_name: "Sports Shoes", image: "/shoes2.jpg", info: "Density Rider Running Shoes", 
	price: 850, rating: 0)

Product.create(tags_id: 4, product_name: "Regular Wallet", image: "/wallet1.jpg", info: "WildHorn Men Formal Brown Genuine Leather Wallet", 
	price: 200, rating: 0)
Product.create(tags_id: 4, product_name: "Leather Wallet", image: "/wallet2.jpg", info: "Puma Men Black Genuine Leather Wallet", 
	price: 500, rating: 0)
