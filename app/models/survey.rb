class Survey < ApplicationRecord
    belongs_to :person
    
    def to_s
        self.title
    end
end
