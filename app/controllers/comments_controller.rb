class CommentsController < ApplicationController
  def create
		if visitor.save
			flash[:notice] = "successfully Created New Comment"
		else
			flash[:notice] = "There was a problem creating your comment"
			set_visitor_sessions
		end

  	redirect_to posts_path
  end

  private

  def visitor_comments_params
  	params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
	end
 
	def visitor
		@visitor ||= VisitorCommentService.new(visitor_comments_params).visitor
	end

	def set_visitor_sessions
		session[:visitor_errors] = visitor.errors.full_messages
		session[:visitor_params] = visitor_comments_params
	end
end
