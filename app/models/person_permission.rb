class PersonPermission < ApplicationRecord
  belongs_to :person
  belongs_to :permission
end
