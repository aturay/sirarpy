class WelcomeController < ApplicationController
  def index
    @sliders  = Slider.where(language: current_language, published: true)
    @we_dos   = WeDo.where(language: current_language, published: true)
    @products = Product.joins(:type, :product_images, :admin_user)
                       .where(language: current_language, published: true)
                       .uniq
    @types    = @products.map { |prd| prd.type }.uniq
  end
end
