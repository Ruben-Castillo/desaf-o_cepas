class ApplicationController < ActionController::Base
    before_action :authenticate_user!


    def authorize_admin!
        unless current_user.admin?
            flash[:alert] = "No tienes autorización para ver esta página"
            redirect_to root_path
        end
    end
end
