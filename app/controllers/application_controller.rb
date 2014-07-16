class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :my_project

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def my_project
    @projects = Project.all
  end
end
