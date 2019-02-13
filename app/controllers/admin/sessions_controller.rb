class Admin::SessionsController < Admin::ApplicationController
  before_action :authorize, except: [:new, :create]
  
  def new
    redirect_to admin_dashboard_index_path if current_moderator
  end

  def create
  	@moderator =Moderator.find_by(username:params[:username]).try(:authenticate, params[:password])
  	if @moderator
  		session[:current_moderator_id] = @moderator.id
  		redirect_to admin_moderators_path, notice:"Successfully Created"
  	else
  		flash[:notice] = "there was a problem with your username or login"
  		render :new
  	end
  end

  def destroy
  	session[:current_moderator_id] = nil
  	redirect_to "/login"
  end
end
