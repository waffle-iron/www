class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_public_api

  protected

  def current_public_api_selected?
    current_public_api_code.present?
  end

  def current_public_api
    @current_public_api = PublicApi.find_by_code(current_public_api_code)
    @current_public_api || PublicApi.new
  end

  def current_public_api_code
    if shopper_signed_in?
      current_shopper.current_public_api
    else
      session['current_public_api_code']
    end
  end
end
