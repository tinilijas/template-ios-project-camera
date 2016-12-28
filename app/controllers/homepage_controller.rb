class HomepageController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @images = Image.all
  end

  def create_image
  image = StringIO.new(Base64.decode64(params[:image].tr(' ', '+')))
  image.class.class_eval { attr_accessor :original_filename, :content_type }
  image.original_filename = SecureRandom.hex + '.png'
  image.content_type = 'image/png'

  create_image = Image.new(image: image)
  create_image.save!
end
end
