class SchoolsController < ApplicationController
	before_action :set_school, only: [:show, :update, :destroy]

	def index
		@schools = School.all
		json_response(@schools)
	end

	def create
		@school = School.create!(school_params)
		json_response(@school, :created)
	end

	def show
		json_response(@school)
	end

	def update
		@school.update(school_params)
		head :no_content
	end

	def destroy
		@school.destroy
		head :no_content
	end

	private
		def school_params
			params.permit(:name, :place)
		end

		def set_school
			@school = School.find(params[:id])
		end

end
