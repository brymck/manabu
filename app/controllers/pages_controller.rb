class PagesController < ApplicationController
  def root
    redirect_to home_path(preferred_locale)
  end

  def about
    @title = t(:about)
    breadcrumbs.add @title, about_path
  end

  def privacy
    @title = t(:privacy)
    breadcrumbs.add @title, privacy_path
  end
end
