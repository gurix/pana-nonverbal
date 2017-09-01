class SubjectsController < ApplicationController
  def new
    @subject = current_subject
  end

  # Creates a new session for a participant and directly start with the first rating
  def create
    @subject = Subject.create
    cookies.encrypted[:subject_token] = @subject.token
    redirect_to edit_rating_path(@subject.rate_next)
  end
end
