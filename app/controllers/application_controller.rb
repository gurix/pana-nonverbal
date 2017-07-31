class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_subject
    Subject.find_by(token: cookies.encrypted[:subject_token]) if cookies.encrypted[:subject_token]
  end
end
