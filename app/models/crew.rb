class Crew < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :title, :origin, :age, :avatar, :species, :unless => proc {new_record?}
end
