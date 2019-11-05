
class Description < ActiveRecord::Base


    has_many :haunt_descriptions
    has_many :haunts, through: :haunt_descriptions

end 

visual = [orbs, shadow, figure, lights, items_moving, apparition]
auditory = [disembodied, voice, scream, growl, footsteps, knocking, cries, giggling, laughing, moaning, unexplained_sounds]
physical = [thrown_item, cold_spot, poltergeist, touch, scratch, possess]