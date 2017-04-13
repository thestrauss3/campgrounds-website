class SuppliesController < ApplicationController
  def index
    if params[:camper_id]
      camper_index
    elsif params[:campground_id]
      campground_index
    else
      @title = "All Supplies:"
      @supplies = Supply.all
    end
  end
  private
  def camper_index
    @camper = Camper.find(params[:camper_id])
    @title = "Supplies Brought by #{@camper.name}"
    @supplies = @camper.supplies
  end
  def campground_index
    @campground = Campground.find(params[:campground_id])
    @title = "Supplies Available at #{@campground.name}"
    @supplies = @campground.supplies
  end
end
