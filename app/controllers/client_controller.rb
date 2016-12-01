class ClientController < ApplicationController
    before_action :logged_in?

    def index
        @clients = Client.all.where(person: @user).order(last_name: :asc)
    end

    def show
        @client = Client.find(params[:id])
    end

    def new
        @client = Client.new
    end

    def create
        @client        = Client.new(client_params)
        @client.person = @user

        if @client.save
            flash[:success] = 'Client added'
            redirect_to @client
        else
            render 'new'
        end
    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        @client = Client.find(params[:id])

        if @client.update(client_params)
            flash[:success] = 'Client saved'
            redirect_to @client
        else
            render 'edit'
        end
    end

    def destroy
        client = Client.find(params[:id])
        client.destroy

        flash[:danger] = 'Client removed'

        redirect_to client_index_path
    end

    private
        def client_params
            params.require(:client).permit(:first_name, :last_name, :email, :phone, :title, :company)
        end
end
