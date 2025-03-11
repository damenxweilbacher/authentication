class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, :role, inclusion: { in: %w[user admin], message: "%{value} is not a valid role" }
  has_secure_password

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end
