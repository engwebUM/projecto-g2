class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.string :kind
      t.integer :money

      t.timestamps null: false
    end
  end
end
