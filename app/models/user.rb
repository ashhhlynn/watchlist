class User < ActiveRecord::Base
 
has_many :adds
has_many :watchings, through: :adds
has_secure_password
end 