class Mobibus < ActiveRecord::Base
  has_many :reportem, dependent: :destroy
end
