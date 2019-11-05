class Haunt < ActiveRecord::Base

    has_many :haunt_descriptions
    has_many :descriptions, through: :haunts

end