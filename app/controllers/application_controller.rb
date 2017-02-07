class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  def index
    if current_user
      @user = current_user
      @characters = @user.characters
    end
  end

end
