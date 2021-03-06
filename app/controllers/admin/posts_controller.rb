class Admin::PostsController < Admin::ApplicationController
  
  def index
    if params[:search].present?
      @posts = Post.matching_title_or_content(params[:search]).page params[:page]
    else
      @posts = Post.all.order(id: :desc).page params[:page]
    end
  end

  def new
    @post =Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.moderator_id = current_moderator.id
    
    if @post.save
      redirect_to admin_posts_url, notice: "Post was Successfully Created"
    else
      flash[:notice] ="There Was A Problem Creating New Post"
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])

     if @post.update(post_params)
      redirect_to admin_posts_path, notice:"Successfully Updated"
     else
      flash[:notice] = "There was an error when updating"
      render "edit"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice:"Successfully Deleted"
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :content, :publish, tag_ids: [])    
  end
end
