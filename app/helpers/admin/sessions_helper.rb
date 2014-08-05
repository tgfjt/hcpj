module Admin::SessionsHelper
  def admin_sign_in(user)
    remember_token = AdminUser.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update(remember_token: AdminUser.encrypt(remember_token))
    self.admin_current_user = user
  end

  def admin_current_user=(user)
    @current_user = user
  end

  def admin_current_user
    remember_token = AdminUser.encrypt(cookies[:remember_token])
    @current_user ||= AdminUser.find_by(remember_token: remember_token)
  end

  def admin_signed_in?
    !admin_current_user.nil?
  end

  def admin_sign_out
    self.admin_current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in_admin
    unless admin_signed_in?
      admin_store_location
      redirect_to new_admin_session_path, notice: "Please Signed in."
    end
  end

  def admin_redirect_back_to(default_url)
    redirect_to(session[:return_to] || default_url, notice: "Signed in.")
    session.delete(:return_to)
  end

  def admin_store_location
    session[:return_to] = request.url
  end

end
