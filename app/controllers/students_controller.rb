class StudentsController < ApplicationController
	before_action :set_school
	before_action :set_school_student, only: [:show, :update, :destroy]

	def index
		json_response(@school.students)
	end

	def create
		@school.students.create!(student_params)
		json_response(@school, :created)
	end

	def show
		json_response(@student)
	end

	def update
		@student.update(student_params)
		head :no_content
	end

	def destroy
		@student.destroy
		head :no_content
	end

	private
		def student_params
			params.permit(:name, :std_class)
		end

		def set_school
			@school = School.find(params[:school_id])
		end

		def set_school_student
			@student = @school.students.find_by!(id: params[:id]) if @school
		end

end
