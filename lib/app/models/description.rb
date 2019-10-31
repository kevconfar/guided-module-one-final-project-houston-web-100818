
class Description < ActiveRecord::Base


    has_many :haunt_descriptions
    has_many :haunts, through: :haunt_descriptions

end 