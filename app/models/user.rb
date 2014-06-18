class User < ActiveRecord::Base
  include Clearance::User
  def admin?
    admin_emails = ['admin@admin.com', '123@aaa.aaa']
    admin_emails.include? self.email
  end
end
