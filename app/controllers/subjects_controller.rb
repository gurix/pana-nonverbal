class SubjectsController < ApplicationController
  def new
    @subject = current_subject
  end

  def create
    @subject = Subject.create
    cookies.encrypted[:subject_token] = @subject.token
    redirect_to edit_rating_path(@subject.rate_next)
  end
end
