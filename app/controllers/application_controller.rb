class ApplicationController < ActionController::Base
  before_action :require_login
  include Monban::ControllerHelpers

  protect_from_forgery with: :exception
end
