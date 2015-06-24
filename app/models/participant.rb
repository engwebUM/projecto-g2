class Participant < ActiveRecord::Base
	has_one :ticket
	has_many :partextras
end
