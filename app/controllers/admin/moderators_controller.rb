class Admin::ModeratorsController < Admin::ApplicationController

	def index
		@moderators = Moderator.all
	end

	def edit
		@moderator = Moderator.find(params[:id])
	end

	def update
		@moderator = Moderator.find(params[:id])	

	 if @moderator.update(moderator_params)
	 	redirect_to admin_moderators_path, notice:"Successfully Updated"
	 else
	 	render "edit"
	end
end

private

def moderator_params
		params.require(:moderator).permit(:id, :fullname, :username, :password )
	end

end

