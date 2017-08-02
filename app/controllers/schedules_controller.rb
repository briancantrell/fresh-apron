class SchedulesController < ApplicationController
  skip_before_action :require_login, only: [:show], raise: false

  def create
    start_date = Date.parse(schedule_params[:start_date])
    end_date = Date.parse(schedule_params[:end_date])
    days_to_schedule = schedule_params[:days].split(",").map &:to_i

    if ScheduleService.schedule_meals(start_date, end_date, days_to_schedule)
      message = { notice: "Meals successfully scheduled." }
    else
      message = { alert: "There was an error scheduling your meals." }
    end

    redirect_to meals_path
  end

  def show
    respond_to do |format|
      format.text do
        cal = RiCal.Calendar do
          Meal.all.each do |meal|
            event do
              summary     meal.recipe.title
              description meal.event_description
              dtstart     meal.scheduled_at
              dtend       (meal.scheduled_at + 1.hour)
              # location    "Cape Canaveral"
              # add_attendee "john.glenn@nasa.gov"
              # alarm do
              #   description "Segment 51"
              # end
            end
          end
        end
      send_data(cal.export, filename: "recipes.ics", disposition: "inline; filename=recipes.ics", type: "text/calendar")
      end
    end
  end

  private

  def schedule_params
    params.permit :start_date, :end_date, :days
  end
end
