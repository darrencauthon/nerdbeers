class Venue < ActiveRecord::Base
  has_many :agendas
end
