class Haunt < ActiveRecord::Base

    has_many :haunt_descriptions
    has_many :descriptions, through: :haunts

    def self.all_haunt_locations
        Haunt.all.map  do |haunt|
            haunt.location
        end
    end

    def find_by_location(location)
        Haunt.all.select do |location|
            location == Haunt.location
    end

    def find_by_type_of_haunting(description)
        Haunt.where(description: type_of_haunting_choice)
    end
end