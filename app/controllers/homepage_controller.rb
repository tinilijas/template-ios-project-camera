class HomepageController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @images = Image.all
  end

  def delete_image
    image = Image.find(params[:image])
    image.destroy!
    redirect_to :back
  end
end
