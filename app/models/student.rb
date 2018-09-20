class Student < ApplicationRecord
	# model associations
	belongs_to :school

	# validations
	validates_presence_of :name, :std_class
end
