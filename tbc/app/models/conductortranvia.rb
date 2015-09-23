class Conductortranvia < ActiveRecord::Base
  belongs_to :tranvium
  belongs_to :conductor
end
