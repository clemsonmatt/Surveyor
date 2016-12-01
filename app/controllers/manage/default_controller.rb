class Manage::DefaultController < ApplicationController
    before_action :logged_in?
    before_action { |c| c.has_role? 'MANAGE_READ' }

    def index
        @people      = Person.all.order(last_name: :asc)
        @permissions = Permission.all.order(role: :asc)
    end
end
