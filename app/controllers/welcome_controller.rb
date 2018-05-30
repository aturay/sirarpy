class WelcomeController < ApplicationController
  def index
    @sliders = Slider.where(language: current_language)
  end
end
