class RatingsController < ApplicationController
  before_action :load_rating, only: %i[edit update]

  def edit
    @rating.update_attributes(showed_at: DateTime.now)
  end

  def update
    @rating.update_attributes(rating_params.merge(rated_at: DateTime.now))
    next_rating = current_subject.rate_next
    return redirect_to(edit_rating_path(next_rating)) if next_rating
    cookies.delete(:subject_token)
    flash[:notice] = t('.end_message')
    redirect_to root_path
  end

  def rating_params
    params.require(:rating).permit(:choosen_id)
  end

  private

  def load_rating
    @subject = current_subject
    @rating = @subject.ratings.find(params[:id])
  end
end
