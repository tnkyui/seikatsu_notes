class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum category: { meats_fish: 0, vegetables: 1, spices: 2, drink: 3, other_food: 30,kitchen_tools: 40, cleaning: 50, beauty: 60, daily_necessities: 70, other: 98, not_set: 99 }
  # 今後増加したときのために数字の間隔を空けています

  def start_time
    self.alert_date.to_time.to_datetime
  end
end
