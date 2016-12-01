class ClientController < ApplicationController
    def index
        @clients = all_clients
    end

    private
        def all_clients
            Client.all.order(last_name: :asc)
        end
end
