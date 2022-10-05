class AddAlertSwitchToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :alert_switch, :boolean, default: 'true', null: false
    change_column :stocks, :hidden_switch, :boolean, default: 'true', null: false
  end
end
