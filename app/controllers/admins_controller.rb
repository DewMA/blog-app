class AdminsController < ApplicationController

    def show
        @admin = Admin.new
    end

    def create 
        admin = Admin.find_by(username: params[:username])
        if admin && admin.authenticate(params[:password])
            session[:admin_id] = admin.id
            redirect_to blogs_path
        else
            flash[:wrong_password] = "Username/Password is Incorrect"
            redirect_to admin_path
        end
    end

    def destroy
        session[:admin_id] = nil
        redirect_to blogs_path
    end
end
