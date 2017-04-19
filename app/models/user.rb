class User < ActiveRecord::Base
  # give User model authentication methods via bcrypt
  has_secure_password

  has_many :reviews

  # makes sure that users cannot register with existing emails
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: { on: create }, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    end
  end
end
