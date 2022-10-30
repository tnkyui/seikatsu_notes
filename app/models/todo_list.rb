class TodoList < ApplicationRecord
  belongs_to :user

  def start_time # シンプルカレンダー用の定義
    self.start_date
  end

  validates :name, presence: true
  validates :start_date, presence: true
  validates :complete_switch, inclusion: { in: [true, false] }
  validates :repeat_days, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }

end
