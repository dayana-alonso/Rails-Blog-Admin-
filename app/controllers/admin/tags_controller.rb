class Admin::TagsController < Admin::ApplicationController

  def new
     @tag = Tag.new
     @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(",").map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice:"Post was Successfully Created"
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tags_params
      redirect_to new_admin_tag_path, notice: "Tag Successfully Updated"
    else
      flash[:notice] = "There was an error when updating"
      render "edit"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
     redirect_to new_admin_tag_path, notice:"Successfully Deleted"
  end


  private

  def tags_params
    params.require(:tag).permit(:id, :name)    
  end
end
