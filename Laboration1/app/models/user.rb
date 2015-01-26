class User < ActiveRecord::Base
  validates :name, length: {maximum: 25}, presence: true, uniqueness: {:scope => :name}
  validates :password, length: {maximum: 60}, presence: true
  validates :key, presence: true
end
