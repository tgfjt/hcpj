class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :signed_in_admin, only: [:new, :create]

  def new
  end

  def create
    user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      admin_sign_in user
      admin_redirect_back_to admin_home_path
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    admin_sign_out
    redirect_to admin_signin_path, :notice => "Signed out."
  end
end
