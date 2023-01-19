class ApplicationController < ActionController::Base
    
    def is_admin
        Admin.find(session[:admin_id]) if session[:admin_id]
    end
    
    helper_method :is_admin
end
