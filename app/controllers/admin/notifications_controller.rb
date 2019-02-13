class Admin::NotificationsController < Admin::ApplicationController
  def index
  	@visitor_notifications = Notification.where(notifiable_type: "Visitor").order(id: :desc)
  	@comment_notifications = Notification.where(notifiable_type: "Comment").order(id: :desc)
  end

  def destroy
  	@notifiable = Notification.find(params[:id])
  	@notifiable.destroy

  	redirect_to admin_notifications_path
  end
end
