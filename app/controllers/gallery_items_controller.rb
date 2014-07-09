class GalleryItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
    @gallery_item = GalleryItem.find params[:id]
  end

  def new
    @gallery_item = GalleryItem.new
  end

  def create
    safe_gallery_item_params = params.require(:gallery_item).permit(:email, :caption, :opt_in)
    @gallery_item = GalleryItem.new safe_gallery_item_params.merge(:upvotes => 1)

    if @gallery_item.save
      redirect_to @gallery_item
    else
      render :new
    end
  end
end

