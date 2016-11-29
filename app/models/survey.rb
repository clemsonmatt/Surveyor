class Survey < ApplicationRecord
    def to_s
        self.title
    end
end
