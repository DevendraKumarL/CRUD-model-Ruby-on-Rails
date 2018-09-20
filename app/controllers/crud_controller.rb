class CrudController < ApplicationController
	protect_from_forgery
	
	def index
		@people = Person.all
	end

	def new
		@person = Person.new
	end

	def create
		@person = Person.new(person_params)
		if @person.save!
			redirect_to :action => 'index'
		else
			render :action => 'new'
		end
	end

	def view
		@person = Person.find_by_id(params[:id])
	end

	def edit
		@person = Person.find_by_id(params[:id])
	end

	def update
		person = Person.find_by_id(params[:id])
		if person.update_attributes(person_params)
			redirect_to :action => 'index'
		else
			render :action => 'edit'
		end
	end

	def destroy
		Person.delete(params[:id])
		redirect_to :action => 'index'
	end

	private
		def person_params
			params.require(:person).permit(:firstname, :lastname, :age, :description)
		end

end
