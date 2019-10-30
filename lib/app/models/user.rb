
class User < ActiveRecord::Base

    has_many :reviews
    has_many :haunts, through: :reviews

end