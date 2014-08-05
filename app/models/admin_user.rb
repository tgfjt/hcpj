class AdminUser < ActiveRecord::Base
  has_secure_password

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  # after_create :create_user_mail_send
  # after_update :update_user_mail_send

  validates :email, presence: true
  validates :name, presence: true
  validates_uniqueness_of :email
  validates_uniqueness_of :name

  def AdminUser.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def AdminUser.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_user_mail_send
    @mail = AdminUserMailer.create_user(self).deliver
  end

  def update_user_mail_send
    return unless self.password.present?
    @mail = AdminUserMailer.update_user(self).deliver
  end

  private
  def create_remember_token
    self.remember_token = AdminUser.encrypt(AdminUser.new_remember_token)
  end

end
