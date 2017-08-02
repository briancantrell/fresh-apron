class Ingredient < ApplicationRecord
  enum units: [:ounce_volume, :ounce_weight, :item_count]

  validates :name, presence: true
  validates :units, presence: true

  def units_abbreviation
    {
      "ounce_volume" => "oz.",
      "ounce_weight" => "oz.",
      "item_count" => "ct."
    }[units]
  end

  def to_json
    {
      id: id,
      name: name,
      units: units
    }
  end
end
