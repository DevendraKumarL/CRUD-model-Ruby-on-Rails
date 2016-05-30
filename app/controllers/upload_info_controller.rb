class UploadInfoController < ApplicationController
	protect_from_forgery

	$current_user = nil

	def upload_form
		@user_id = params[:id]
		@user = User.find_by_id(@user_id)
		$current_user = @user
	end

	def save_data
		@user = $current_user
		@user = UserUploadDatum.create(users_id: @user.id,shopName: params[:shopname],offers: params[:offer],startingPrice: params[:startingPrice],endDate: params[:endDate])
		if @user
			redirect_to :controller => "register_login", :action => "index", :notice => "Uploaded data successfully"
		else
			flash[:notice] = "Failed to upload data"
			render "upload_form", :notice => "Failed to upload data"
		end
	end

	def view_data
		@user = $current_user
		@user_data = UserUploadDatum.where(:users_id => @user.id)
	end

	def edit_data
		@data_id = params[:id]
		@this_data = UserUploadDatum.find_by_id(@data_id)
	end

	def update_data
		@data_id = params[:update_id]
		@this_data = UserUploadDatum.find(@data_id)
		@this_data.shopName = params[:shopname]
		@this_data.offers = params[:offer]
		@this_data.startingPrice = params[:startingPrice]
		@this_data.endDate = params[:endDate]
		@this_data.save
		redirect_to :controller => "register_login", :action => "index"
	end

	def delete_data
		@this_data = params[:id]
		@deleted = UserUploadDatum.delete(@this_data)
		redirect_to :controller => "register_login", :action => "index"
	end
end
