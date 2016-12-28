class HomepageController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @images = Image.all
  end
end
