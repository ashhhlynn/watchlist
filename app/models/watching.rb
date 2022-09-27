class Watching < ActiveRecord::Base
    has_many :adds
    has_many :users, through: :adds

  end 