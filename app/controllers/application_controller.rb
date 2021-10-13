class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception # included by default, protects from hackers
    helper_method :current_user, :logged_in?
    
    def current_user
        User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end

    def require_login # is not used in the views, that's why not listed above
        if current_user 
            current_user
        else 
            redirect_to root_path
        end 
    end
end
