class Event < ActiveRecord::Base
    belongs_to :location

    def find_affordability()
        self.price <= 200
    end
end