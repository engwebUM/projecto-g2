require 'csv'

# Participant
class Participant < ActiveRecord::Base
  has_one :ticket
  has_many :partextras

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Participant.create! row.to_hash
    end
  end
end
