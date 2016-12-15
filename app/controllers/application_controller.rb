class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_is_admin!
    unless current_user.is_admin?
      flash[:error] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end
end
