class SightingSerializer
    # the goal of this is to take whatever variable we're dealing with in a particular action, and store it as an instance variable
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    # This method adds the code we would have had to use in each controller action.  
    # Once an instance of SightingSerializer is created, we can call to_serialized_json on it to get our data customized and ready to go as a JSON string
    def to_serialized_json
        @sighting.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])
    end
end