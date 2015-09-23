class Conductormobibus < ActiveRecord::Base
  belongs_to :mobibus
  belongs_to :conductor
end
