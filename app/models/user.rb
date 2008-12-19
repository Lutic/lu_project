class User < ActiveRecord::Base
  validates_presence_of :login, :password, :email
  validates_length_of :password, :within => 3..20
  validates_uniqueness_of :login, :email
  
  has_many :tasks
  
  SALT = 'rt'
end
