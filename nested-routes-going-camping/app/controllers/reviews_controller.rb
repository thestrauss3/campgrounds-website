
class ReviewsController < ApplicationController
  def index
    @campground = Campground.find(params[:campground_id])
    @reviews = Review.where(campground: params[:campground_id])
  end

  def show
  end

  def new
    @review = Review.new
    @campground = Campground.find(params[:campground_id])
  end
  def create
    @review = Review.new(review_params)
    @review.camper = Camper.find_or_create_by(name: params["review"]["camper"])
    @review.campground = Campground.find(params[:campground_id])
    if @review.save
      flash[:notice] = "Review submitted. Thank you!"
      redirect_to campground_reviews_path(Campground.find(params[:campground_id]))
    else
      flash[:alert] = "Review was not submitted."
      @campground = Campground.find(params[:campground_id])
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :title,
      :body,
      :rating
    )
  end
end
