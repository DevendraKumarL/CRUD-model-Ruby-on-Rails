class RegisterLoginController < ApplicationController
	protect_from_forgery

	$current_user = nil

	def index
		@user = $current_user
	end

	def new_user
		@user = User.new
	end

	def create_user
		if params[:password] == params[:password2]
			@check_email = User.find_by_email(params[:email])
			if @check_email
				flash[:notice] = "Email is already taken"
				render :controller => 'register_login' , :action => 'new_user', :notice => "Email is already taken"
			else
				@user = User.new(user_params)
				if @user.save
          			# flash[:notice] = "Registered successfully"
          			redirect_to :controller => 'register_login', :action => 'login_user', :notice => "Registered successfully"
     			else
      				flash[:notice] = "Email invalid"
      				render :action => 'new_user', :notice => "Email invalid"
      			end
  			end
		else
			flash[:notice] = "Passwords do not match"
			render :controller => 'register_login' , :action => 'new_user', :notice => "Passwords do not match"
		end
	end

	def login_user
		@user = $current_user
		if @user
			redirect_to :controller => 'register_login', :action => 'index'
		end
	end

	def user_authentication
		user = User.authenticate(params[:email_log], params[:password_log])
		if user
  			session[:user_id] = user
  			$current_user = session[:user_id]
  			redirect_to :controller => 'register_login', :action => 'index', :notice => "Logged in successfully"
  		else
  			flash[:notice] = "Invalid email or password"
  			redirect_to :controller => 'register_login', :action => 'login_user', :notice => "Invalid email or password"
  		end
  	end

	def destroy
    	session[:user_id] = nil
    	$current_user = nil
    	flash[:notice] = "Logged out"
  		redirect_to :controller => 'register_login', :action => 'index', :notice => "Logged out"
  	end

	private
		def user_params
			params.permit(:username, :email, :password)
		end
end
