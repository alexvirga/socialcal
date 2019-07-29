class ApplicationController < ActionController::Base
    helper_method :user_authorize
    def user_authorize
      if session[:user_id]
       
      end 
    end
end
