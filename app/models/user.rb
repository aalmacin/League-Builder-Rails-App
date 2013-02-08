class User < ActiveRecord::Base
  attr_accessible :password

  has_secure_password
end
