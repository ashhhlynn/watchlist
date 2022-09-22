class User < ActiveRecord::Base
 
has_many :adds
has_many :watchings, through: :adds

end 