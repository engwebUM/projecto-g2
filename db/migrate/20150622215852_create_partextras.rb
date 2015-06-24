class CreatePartextras < ActiveRecord::Migration
  def change
    create_table :partextras do |t|
      t.references :extra, index: true
      t.references :participant, index: true

      t.timestamps null: false
    end
    add_foreign_key :partextras, :extras
    add_foreign_key :partextras, :participants
  end
end
