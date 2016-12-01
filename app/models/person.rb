class Person < ApplicationRecord
    has_many :person_permissions, :dependent => :destroy
    has_many :permissions, :through => :person_permissions

    def to_s
        "#{self.first_name} #{self.last_name}"
    end

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true

    def has_role?(role)
        permissions.any? { |permission| permission.role == role }
    end
end
