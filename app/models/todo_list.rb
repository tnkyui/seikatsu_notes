class TodoList < ApplicationRecord
  belongs_to :user

  def start_time
    self.start_date
  end
end
