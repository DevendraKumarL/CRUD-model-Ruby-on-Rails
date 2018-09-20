class School < ApplicationRecord
	# model association
	has_many :students, dependent: :destroy

	# validations
	validates_presence_of :name, :place
end
