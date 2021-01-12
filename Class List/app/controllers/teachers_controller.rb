class TeachersController < ApplicationController

  def index
    if params[:search]
      @teachers = Teacher.where('name LIKE ?', "%#{params[:search]}%")
    else
      @teachers = Teacher.all
    end 
    #@teachers = Teacher.all
    #@teachers = Teacher.search(params[:search])
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end



end
