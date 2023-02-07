class Location < ActiveRecord::Base
    has_many :events
    has_many :styles, through: :events
end