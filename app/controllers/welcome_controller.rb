class WelcomeController < ApplicationController
  def index
    @sliders  = Slider.where(language: current_language, published: true)
    @we_dos   = WeDo.where(language: current_language, published: true)
    @products = Product.joins(:type, :product_images, :admin_user)
                       .where(language: current_language, published: true)
                       .uniq
    @types    = @products.map { |prd| prd.type }.uniq
    @staffs   = AdminUser.staffs
    @skills   = Type.where(language: current_language)
                    .where(published: true)
                    .order(position: :asc)
    @contact = Contact.where(language: current_language).last
  end
end
