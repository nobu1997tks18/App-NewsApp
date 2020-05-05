class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum:50}
  Email_Regex = /\A[\w\-.]+@\w*.(?!.*?\.\.)(\.[\w\.]+)\z/
  validates :email, presence: true,length: {maximum:100},
            format:{with: Email_Regex},
            uniqueness:{case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 8}, allow_nil: true
end
