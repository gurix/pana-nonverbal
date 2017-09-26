class RatingsController < ApplicationController
  before_action :load_rating, only: %i[edit update]

  def edit
    # Whenever a rating is displayed, we timestamp it to calculate the time a partacipant needed to rate the emoji
    @rating.update_attributes(showed_at: DateTime.now)
  end

  def update
    # Set a timestamp for rating to to calculate the time a partacipant needed to rate the emoji
    @rating.update_attributes(rating_params.merge(rated_at: DateTime.now))

    # Redirect to next rating
    next_rating = @subject.rate_next
    # Jump directly to the buttns after the second rating. So we don't have to scroll on mobile
    anchor = 'distractor_buttons' if @subject.ratings.rated.count > 1
    return redirect_to(edit_rating_path(next_rating, anchor: anchor)) if next_rating

    # Otherwise we are at the end and can finish the experiment for this participant
    cookies.delete(:subject_token)
    redirect_to page_path(:finish)
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
