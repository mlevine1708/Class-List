class ApplicationController < ActionController::API
  include ApplicationHelper
 # before_action :check_for_logged_in
  
  def test
    students = []
    Student.all.each do |student| 
      students << student.attributes
    end

    render json: { students: students }.to_json
  end

  def current_teacher
    Teacher.find_by(name: "Kelly")
  end 

  private
    def check_for_logged_in
      redirect_to '/' if !logged_in?
    end

end
