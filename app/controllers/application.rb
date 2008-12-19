# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :find_user

  protected

  def find_user
    if session[:user_id]
      @current_user = User.find_by_id session[:user_id]
    end
  end
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9afd48bd017251a85902dca4f26c7cac'
end
