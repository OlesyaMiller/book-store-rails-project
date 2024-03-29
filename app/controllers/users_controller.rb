class UsersController < ApplicationController

    before_action :require_login, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save && @user.valid?
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        find_user
    end

    def edit
        find_user
        if @user == current_user
            render :edit 
        else
            redirect_to user_path(current_user)
        end
    end

    def update 
        find_user
        if @user
            @user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    private
    
    def user_params
        params.require(:user).permit(
            :username, 
            :credit, 
            :email, 
            :password, 
            :password_confirmation,
            :role
        )
    end    

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
