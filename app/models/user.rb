class User < ApplicationRecord
  has_many :comments
  has_many :posts

  def full_name
    "#{first_name} #{last_name}"
  end
end
