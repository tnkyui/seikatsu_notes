class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum category: { meats_fish: 0, vegetables: 1, other_food: 2, drink: 3, kitchen_tools: 4, cleaning: 5, beauty: 6, daily_necessities: 7, other: 8, not_set: 9 }

  def start_time
    self.alert_date.to_time.to_datetime
  end
end
