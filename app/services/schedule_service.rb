class ScheduleService
  def self.schedule_meals(start_date, end_date, days_to_schedule)
    (start_date..end_date).map do |day|
      if days_to_schedule.include?(day.wday)
        scheduled_at = DateTime.new(
          day.year,
          day.month,
          day.day,
          19, 0, 0
        )

        Meal.find_or_create_by(
          scheduled_at: scheduled_at,
          recipe: Recipe.all.sample
        )
      end
    end
  end
end
