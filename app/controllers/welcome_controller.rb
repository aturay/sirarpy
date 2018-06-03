class WelcomeController < ApplicationController
  def index
    @sliders = Slider.where(language: current_language, published: true)
    @we_dos = WeDo.where(language: current_language, published: true)
  end
end
