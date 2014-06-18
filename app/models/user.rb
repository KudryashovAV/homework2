class User < ActiveRecord::Base
  include Clearance::User
  def admin?
    admin_emails = ['123@qwe.qwe']
    admin_emails.include? self.email
  end
end
