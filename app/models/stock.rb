class Stock < ApplicationRecord
  belongs_to :user

  enum category: { meats_fish: 0, vegetables: 1, spices: 2, drink: 3, other_food: 30, kitchen_tools: 40, cleaning: 50, beauty: 60, daily_necessities: 70, other: 98, not_set: 99 }
  # 今後増加したときのために数字の間隔を空けています

  def start_time # シンプルカレンダー用の定義
    self.alert_date.to_time.to_datetime
  end

  validates :name, presence: true
  validates :purchase_date, presence: true
  validates :percentage, presence: true
  validates :stock_amount, numericality: {only_integer: true, greater_than_or_equal_to: 0	}
  validates :category, presence: true
  validates :alert_date, presence: true
  # validates :alert_switch, presence: true
  # validates :hidden_switch, presence: true

end
