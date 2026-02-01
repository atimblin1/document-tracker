class ApplicationController < ActionController::Base
  helper_method :demo_mode?
  
  def demo_mode?
    ENV['DEMO_MODE']&.downcase == 'true' || Rails.env.production?
  end
  
  def ensure_not_demo_mode!
    if demo_mode?
      flash[:alert] = "This action is disabled in demo mode. Run the app locally for full functionality."
      redirect_back(fallback_location: root_path)
    end
  end
end
