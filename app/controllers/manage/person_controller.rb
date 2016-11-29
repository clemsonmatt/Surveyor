class Manage::PersonController < ApplicationController
    def index
        @people = all_people
    end

    def show
        @person = Person.find(params[:id])
    end

    def new
        @person = Person.new
    end

    def create
        @person        = Person.new(person_params)
        @person.active = true

        if @person.save
            redirect_to manage_person_path(@person)
        else
            render 'new'
        end
    end

    def edit
        @person = Person.find(params[:id])
    end

    def update
        @person = Person.find(params[:id])

        if @person.update(person_params)
            redirect_to manage_person_path(@person)
        else
            render 'edit'
        end
    end

    def destroy
        person = Person.find(params[:id])
        person.destroy

        redirect_to person_index_path
    end

    private
        def all_people
            Person.all.order(last_name: :asc)
        end

        def person_params
            params.require(:person).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
