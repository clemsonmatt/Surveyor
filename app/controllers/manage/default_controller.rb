class Manage::DefaultController < ApplicationController
    def index
        @people      = Person.all.order(last_name: :asc)
        # @permissions = Permission.all.order(role: :asc)
    end
end
