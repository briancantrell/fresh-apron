class MealScheduler
  def self.schedule_meals(start_date, end_date, days_to_schedule, user)
    (start_date..end_date).map do |day|
      if days_to_schedule.include?(day.wday)
        scheduled_at = Time.new(
          day.year,
          day.month,
          day.day,
          19, 0, 0
        )

        user
          .meals
          .find_or_create_by(scheduled_at: scheduled_at) do |meal|
            meal.recipe = Recipe.all.sample
        end
      end
    end
  end
end
