class Person < ActiveRecord::Base
	validates_presence_of :firstname, :lastname, :age, :description
	validates :age, numericality: { greater_than: 1 }
	validates :age, length: { maximum: 3 }
	validates :age, numericality: { less_than_or_equal_to: 100 } 
end
