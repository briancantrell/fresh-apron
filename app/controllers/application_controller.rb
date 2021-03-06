class ApplicationController < ActionController::Base
  before_action :require_login
  around_action :set_time_zone, if: :current_user

  include Monban::ControllerHelpers

  protect_from_forgery with: :exception

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
