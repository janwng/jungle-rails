class User < ActiveRecord::Base
  # give User model authentication methods via bcrypt
  has_secure_password

  has_many :reviews
end
