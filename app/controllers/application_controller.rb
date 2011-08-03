class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_initial_breadcrumbs

  private

  def add_initial_breadcrumbs
    breadcrumbs.add t(:home), root_path
  end
end
