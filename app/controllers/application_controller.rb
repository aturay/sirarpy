class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_language

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def current_language
    Language.find_by_language set_locale
  end
end
