class Admin::ApplicationController < ActionController::Base
	before_action :authorize

	layout "admin"

	def current_moderator
		@moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
	end

	def authorize
		unless current_moderator
			redirect_to'/login', notice: "Please login to view admin pages"
		end
	end
end