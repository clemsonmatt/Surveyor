class Manage::PermissionController < ApplicationController
    before_action :logged_in?
    before_action { |c| c.has_role? 'MANAGE_WRITE' }

    def new
        @permission = Permission.new
    end

    def create
        @permission      = Permission.new(permission_params)
        @permission.role = @permission.role.upcase

        if @permission.save
            flash[:success] = 'Permission added'
            redirect_to manage_default_index_path
        else
            render 'new'
        end
    end

    def destroy
        permission = Permission.find(params[:id])
        # permission.destroy

        flash[:danger] = 'Permission removed'

        redirect_to manage_default_index_path
    end

    private
        def permission_params
            params.require(:permission).permit(:role)
        end
end
