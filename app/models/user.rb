class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def password=(pwd)
    generated_password(pwd)
  end

  def self.authenticated?(username, password)
    user = User.find_by_username(username)
    if user && Digest::SHA256.hexdigest(password + user.salt) == user.hashed_password
      user
    else
      false
    end
  end

  private

  def generated_password(pwd)
    self.salt = Array.new(10) { rand(1024).to_s(36) }.join
    self.hashed_password = Digest::SHA256.hexdigest(pwd + salt)
  end
end
