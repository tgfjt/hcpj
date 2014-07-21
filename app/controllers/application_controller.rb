class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :my_project

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def my_project
    @projects = Project.my_project current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:role, :name]
    devise_parameter_sanitizer.for(:account_update).concat [:role, :name]
  end
end
