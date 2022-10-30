class Stock < ApplicationRecord
  belongs_to :user

  enum category: { meats_fish: 0, vegetables: 1, spices: 2, drink: 3, other_food: 30, kitchen_tools: 40, cleaning: 50, beauty: 60, daily_necessities: 70, other: 98, not_set: 99 }
  # 今後増加したときのために数字の間隔を空けています

  def start_time # シンプルカレンダー用の定義
    self.alert_date.to_time.to_datetime
  end

  def add_stock(stock_amount,purchase_date,category,alert_setting) #既存のｽﾄｯｸの情報を更新する
    self.stock_amount += stock_amount.to_i
    self.purchase_date = purchase_date
      unless category == "not_set"
        self.category = category
      end
    self.alert_date = self.purchase_date.to_time.to_datetime + alert_setting.to_i
      if alert_setting == "0"
        self.update(alert_switch: "false")
      else
        self.update(alert_switch: "true")
      end
  end

  def new_stock(stock_amount,alert_setting)
    self.alert_date = self.purchase_date.to_time.to_datetime + alert_setting.to_i
    self.stock_amount = stock_amount.to_i - 1 #購入数のうちの1つはｽﾄｯｸではなく残量100%扱いにする
      if alert_setting == "0"
        self.update(alert_switch: "false")
      end
  end

  validates :name, presence: true
  validates :purchase_date, presence: true
  validates :percentage, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100	}
  validates :stock_amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0	}
  validates :category, presence: true
  validates :alert_date, presence: true
  validates :alert_switch, inclusion: { in: [true, false] }
  validates :hidden_switch, inclusion: { in: [true, false] }

end
