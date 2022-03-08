class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    # Add admin/user redirect once admin added
    root_path
  end
end
