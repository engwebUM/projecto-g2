class AddFieldsToParticipant < ActiveRecord::Migration
  def change
    add_reference :participants, :ticket, index: true
    add_foreign_key :participants, :tickets
  end
end
