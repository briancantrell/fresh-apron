class TwoWeekPlanner
  attr_reader :weeks

  def initialize
    @weeks = []
    @weeks << PlannerWeek.new(0, 6) << PlannerWeek.new(7, 13)
  end

  def add_meals(meals)
    meals.each do |meal|
      planner_week = if meal.scheduled_at < weeks.last.first
        weeks.first
      else
        weeks.last
      end
      planner_week[meal.scheduled_at].meals << meal
    end
  end

  def date_filter(meals)
    meals.where(
      "scheduled_at > ? and scheduled_at < ?",
      weeks.first.first, weeks.last.last
    )
  end
end
