class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an expection.
	# # For API's, you may want to use :null_session instead.
	protect_from_forgery with: :exception
end
