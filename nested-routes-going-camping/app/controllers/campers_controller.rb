class CampersController < ApplicationController

  def index
    if params[:campground_id]
      campground_index
    else
      @title = "All Campers:"
      @campers = Camper.all
    end
  end
  private
  def campground_index
    @campground = Campground.find(params[:campground_id])
    @title = "Campers Bunking in #{@campground.name}"
    @campers = []
    @campground.campsites.each do |campsite|
      @campers += campsite.campers
    end
  end
end
