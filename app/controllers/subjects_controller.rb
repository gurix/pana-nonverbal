class SubjectsController < ApplicationController
  def new
    @subject = current_subject
  end

  def create
    @subject = Subject.create
    cookies.encrypted[:subject_token] = @subject.token
    redirect_to root_path
  end
end
