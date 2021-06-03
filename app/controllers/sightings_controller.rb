class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        # render json: sightings.to_json(:include => {
        #   :bird => {:only => [:name, :species]},
        #   :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])

        # The above can now be written using the logic created in sightings_serializer.rb
        render json: SightingSerializer.new(sightings).to_serialized_json
    end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting.to_json(:include => {
        #   :bird => {:only => [:name, :species]},
        #   :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])
        render json: SightingSerializer.new(sightings).to_serialized_json
    end
end
