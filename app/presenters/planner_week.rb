class PlannerWeek
  attr_reader :days

  delegate :length, to: :days
  delegate :last, to: :days
  delegate :first, to: :days

  def initialize(start_offset, end_offset)
    @days = build_week(start_offset, end_offset)
  end

  def [](day)
    @days.find { |planner_day| planner_day.to_date == day.to_date }
  end

  def build_week(start_offset, end_offset)
    start_offset.upto(end_offset).map do |i|
      day = Time.zone.now.beginning_of_week(:sunday) + i.day
      PlannerDay.new(
                        Time.parse(day.strftime("%Y-%m-%d") + " 19:00")
      )
    end
  end
end

