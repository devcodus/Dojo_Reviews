class ReviewsController < ApplicationController
  def index
    @reviews = Review.includes(:book, :user).all
  end

  def create
  end

  def destroy
  end
end
