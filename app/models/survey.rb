class Survey < ApplicationRecord
    belongs_to :person

    has_many :questions, :dependent => :destroy

    def to_s
        self.title
    end
end
