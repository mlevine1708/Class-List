class ApplicationController < ActionController::API
  include ApplicationHelper
  before_action :check_for_logged_in
  
  def test
    render json: { test: "success" }
  end

  private
    def check_for_logged_in
      redirect_to '/' if !logged_in?
    end

end
