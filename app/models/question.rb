class Question < ApplicationRecord
    belongs_to :survey

    validates :title, presence: true
    validates :question_type, presence: true

    def valid_types
        {
            'Text'                         => 'text',
            'Multiple Choice (select one)' => 'select_one',
            'Multiple Choice (select all)' => 'select_all',
            'Yes/No'                       => 'yes_no',
        }
    end

    def format_type
        valid_types.key(self.question_type)
    end
end
