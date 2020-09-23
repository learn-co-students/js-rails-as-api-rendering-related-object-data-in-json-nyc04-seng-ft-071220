class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location], except: [:updated_at]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, include: [:bird, :location], except: [:updated_at]
        else
            render json: {message: "Not Found"}
        end
    end
end
