class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name,         null: false
      t.date :purchase_date,  null: false
      t.integer :percentage,  null: false
      t.integer :stock_amount,null: false
      t.integer :category, null: false
      t.datetime :alert_date, null: false
      t.boolean :hidden_switch, default: false, null: false
      t.integer :user_id,     null: false

      t.timestamps
    end
  end
end
