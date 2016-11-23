class Survey < ApplicationRecord

    def active
        return ! (self.status == 'active' && self.end_date < Date.today)
    end
end
