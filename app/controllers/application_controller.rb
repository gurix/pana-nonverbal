class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  # The current subject or participant is deposited in a cookie
  def current_subject
    Subject.find_by(token: cookies.encrypted[:subject_token]) if cookies.encrypted[:subject_token]
  end

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
