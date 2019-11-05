
require_relative '../config/environment'

class HauntDescription < ActiveRecord::Base

    belongs_to :haunt
    belongs_to :description

end