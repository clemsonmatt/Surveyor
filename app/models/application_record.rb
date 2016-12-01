class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.nilify_blanks
end
