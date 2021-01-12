class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :check_for_logged_in

  private
    def check_for_logged_in
      redirect_to '/' if !logged_in?
    end

end
