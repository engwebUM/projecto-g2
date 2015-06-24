class AddAppearedToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :appeared, :boolean
  end
end
