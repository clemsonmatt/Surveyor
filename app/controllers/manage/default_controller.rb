class Manage::DefaultController < ApplicationController
    before_action :logged_in?
    before_action :has_manage_role?

    def index
        @people      = Person.all.order(last_name: :asc)
        @permissions = Permission.all.order(role: :asc)
    end
end
