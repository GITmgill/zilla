class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    #if its a bad slug, re-direct to correct URL
  def bad_slug?(object)
    params[:id] != object.to_param
  end

  ##
  # 301 redirect to canonical slug.
  def redirect_to_good_slug(object)
      redirect_to params.merge({
                    :controller => controller_name,
                    :action => params[:action],
                    :id => object.to_param,
                    :status => :moved_permanently
                  })
  end

  private
	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
	  redirect_to login_url, alert: "Not authorized" if current_user.nil?
	end
end
