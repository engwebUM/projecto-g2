class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :kind
      t.integer :money

      t.timestamps null: false
    end
  end
end
