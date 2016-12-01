class Manage::PersonController < ApplicationController
    def index
        @people = all_people
    end

    def show
        @person      = Person.find(params[:id])
        @permissions = Permission.all.order(role: :asc)
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

        updated_params = person_params

        new_permissions = []
        updated_params[:permissions].each do |permission_id|
            if permission_id != ""
                new_permissions << Permission.find(permission_id)
            end
        end

        updated_params[:permissions] = new_permissions

        if @person.update(updated_params)
            redirect_to manage_person_path(@person)
        else
            render 'edit'
        end
    end

    def destroy
        person = Person.find(params[:id])
        person.destroy

        redirect_to manage_person_index_path
    end

    def add_permission
        @person    = Person.find(params[:id])
        permission = Permission.find(params[:permission_id])

        if ! @person.permissions.include?(permission)
            @person.permissions << permission
            @person.save
        end
    end

    def remove_permission
        @person    = Person.find(params[:id])
        permission = Permission.find(params[:permission_id])

        personPermission = PersonPermission.find_by(person_id: @person.id, permission_id: permission.id)
        personPermission.destroy
    end

    private
        def all_people
            Person.all.order(last_name: :asc)
        end

        def person_params
            params.require(:person).permit(:first_name, :last_name, :email, :password, :password_confirmation, :permissions => [])
        end
end
