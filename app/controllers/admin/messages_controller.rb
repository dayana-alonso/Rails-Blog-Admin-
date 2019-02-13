class Admin::MessagesController < Admin::ApplicationController
  def index
  	if params[:search].present?
  		@message = Message.matching_fullname_or_content(params[:search]).page params[:page]
  	else
  	@message = Message.all.order(id: :desc).page params[:page] 
 	 end
	end

  def show
  end

  def update
  	@message = Message.find(params[:id])
		@message.update(status: params[:status])

    redirect_to admin_messages_path, notice:"Successfully Updated"
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy

  	redirect_to admin_messages_path, notice:"Message was Successfully Deleted"
  end


  def message_params
    params.require(:message).permit(:id, :content, :status, :visitor [])    
  end

end
