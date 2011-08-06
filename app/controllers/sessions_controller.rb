class SessionsController < ApplicationController
  def new
    session[:locale] = params[:locale]
    breadcrumbs.add t("meta.sessions.new.title"), login_path
  end

  def create
    auth = request.env["omniauth.auth"]

    session.merge!(
      'email'    => auth['user_info']['email'] || auth['extra']['user_hash']['email'] || '',
      'name'     => auth['user_info']['name']  || auth['extra']['user_hash']['name']  || '',
      'provider' => auth['provider'],
      'uid'      => auth['uid']
    )
    determine_admin_status
    redirect_to get_referer, :notice => t(:logged_in, get_locale_and_scope)
  end

  def destroy
    session.merge!('admin' => false, 'uid' => nil)
    redirect_to get_referer, :notice => t(:logged_out, get_locale_and_scope)
  end

  def failure
    redirect_to get_referer, :alert => t(:failure, get_locale_and_scope)
  end
end
