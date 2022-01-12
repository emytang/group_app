class User < ApplicationRecord
  belongs_to :group
  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
