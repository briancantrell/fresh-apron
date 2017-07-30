class Ingredient < ApplicationRecord
  enum units: [:ounce_volume, :ounce_weight, :item_count]

  validates :name, presence: true
  validates :units, presence: true

  def to_json
    {
      id: id,
      name: name,
      units: units
    }
  end
end
