class Admin::ApplicationController < ActionController::Base
  # include SslRequirement

  # ssl_required :all

  before_action :signed_in_admin

  protect_from_forgery with: :null_session
  include Admin::SessionsHelper

  layout 'admin/layouts/application'

  def get_checkbox_array
    chkboxs = params[:chkbox_array]
    values = chkboxs.values
    non_check_size = values.select {|value| value == '0'}.size
    return nil if non_check_size == values.size
    chkboxs
  end

  protected
  # def ssl_required?
  #   Rails.env.production? || Rails.env.staging?
  # end

  private
end
