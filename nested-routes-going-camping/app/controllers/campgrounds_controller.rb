class CampgroundsController < ApplicationController

  def index
    @title = "All campgrounds:"
    @campgrounds = Campground.all
  end

  def show
    @campground = Campground.find(params[:id])
  end
end
