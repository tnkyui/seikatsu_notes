class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  def start_time
    self.alert_date.to_time.to_datetime
  end
end
