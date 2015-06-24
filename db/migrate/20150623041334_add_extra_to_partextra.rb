class AddExtraToPartextra < ActiveRecord::Migration
  def change
    add_column :partextras, :kind, :string
  end
end
