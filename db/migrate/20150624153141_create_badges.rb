class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.references :participant, index: true

      t.timestamps null: false
    end
    add_foreign_key :badges, :participants
  end
end
