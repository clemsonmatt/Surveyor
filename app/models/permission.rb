class Permission < ApplicationRecord
    has_many :person_permissions, :dependent => :destroy
    has_many :people, :through => :person_permissions
end
