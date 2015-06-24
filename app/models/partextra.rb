class Partextra < ActiveRecord::Base
  belongs_to :extra
  belongs_to :participant
end
