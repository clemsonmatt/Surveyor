class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def render_403
        respond_to do |format|
            format.html { render :file => "#{Rails.root}/public/403", :layout => false, :status => :denied }
            format.xml  { head :denied }
            format.any  { head :denied }
        end
    end

    def render_404
        respond_to do |format|
            format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
            format.xml  { head :not_found }
            format.any  { head :not_found }
        end
    end

    private
        def logged_in?
            @user ||= Person.find(session[:user_id]) if session[:user_id]

            if ! @user
                redirect_to login_path
            end
        end

        def has_manage_role?
            @user ||= Person.find(session[:user_id]) if session[:user_id]

            if ! @user.has_role?('MANAGE_READ')
                render_403
            end
        end

        helper_method :logged_in?
        helper_method :has_manage_role?
end
