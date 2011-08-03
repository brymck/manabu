class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale, :add_initial_breadcrumbs

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }
  end

  private

  def add_initial_breadcrumbs
    breadcrumbs.add t(:home), home_path
  end

  def preferred_locale
    return [] if request.accept_language.nil?

    request.accept_language.split(",").each do |language|
      return language if I18n.available_locales.include?(language.to_sym)
    end

    I18n.default_locale.to_s
  end
end
