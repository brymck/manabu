class PagesController < ApplicationController
  def root
    redirect_to home_path(preferred_locale)
  end

  def home
  end

  def about
  end

end
