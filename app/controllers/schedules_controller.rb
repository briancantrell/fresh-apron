class SchedulesController < ApplicationController
  skip_before_action :require_login, only: [:index], raise: false

  def create
    start_date = Date.parse(schedule_params[:start_date])
    end_date = Date.parse(schedule_params[:end_date])
    days_to_schedule = current_user.profile.meal_days

    if MealScheduler.schedule_meals(start_date, end_date, days_to_schedule, current_user)
      message = { notice: "Meals successfully scheduled." }
    else
      message = { alert: "There was an error scheduling your meals." }
    end

    redirect_to meals_path
  end

  def index
    user = User.find_by!(auth_token: params[:token])
    respond_to do |format|
      format.any do
        cal = CalendarBuilder.generate_calendar(user)
        send_data(cal.export,
                  filename: "recipes.ics",
                  disposition: "inline; filename=recipes.ics", type: "text/calendar"
                 )
      end
    end
  end

  private

  def schedule_params
    params.permit :start_date, :end_date, :days
  end
end
