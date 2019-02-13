class Admin::CommentsController < Admin::ApplicationController
  def index
  	if params[:search].present?
  		@comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
  	else
  		@comments = Comment.where(status: params[:status]).page params[:page]
  	end
  end

  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(status:params[:status])
  		redirect_to admin_comments_path, notice: "successfully Updated"
  	else
  		redirect_to admin_comments_path, notice: "Update failed" 
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to admin_comments_path, notice:"Successfully Deleted"
  end
end
