class Manage::PermissionController < ApplicationController
    before_action :logged_in?
    before_action :has_manage_role?

    def new
        @permission = Permission.new
    end

    def create
        @permission      = Permission.new(permission_params)
        @permission.role = @permission.role.upcase

        if @permission.save
            redirect_to manage_default_index_path
        else
            render 'new'
        end
    end

    def destroy
        permission = Permission.find(params[:id])
        permission.destroy

        redirect_to manage_default_index_path
    end

    private
        def permission_params
            params.require(:permission).permit(:role)
        end
end
