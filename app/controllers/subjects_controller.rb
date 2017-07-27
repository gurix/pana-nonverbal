class SubjectsController < ApplicationController
  def new
    @subject = Subject.find_by(token: cookies.encrypted[:subject_token]) if cookies.encrypted[:subject_token]
  end

  def create
    @subject = Subject.create
    cookies.encrypted[:subject_token] = @subject.token
    redirect_to root_path
  end
end
