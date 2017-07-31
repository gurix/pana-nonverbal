class RatingsController < ApplicationController
  before_action :load_rating, only: %i[edit update]

  def edit
    @rating.update_attributes(showed_at: DateTime.now)
  end

  def update; end

  private

  def load_rating
    @rating = current_subject.ratings.find(params[:id])
  end
end
