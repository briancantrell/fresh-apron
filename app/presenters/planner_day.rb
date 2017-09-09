class PlannerDay < SimpleDelegator
  attr_accessor :meals
  def initialize(day)
    super(day)
    @meals = []
  end
end

