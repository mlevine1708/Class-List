class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def new
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      @student = teacher.students.build
    else
      @student = Student.new
      @student.build_teacher
    end
    students = []
    Student.all.each do |student|
      students << student.attributes
    end

    render json: { students: students }.to_json
  end


  def create
    @student = Student.new(student_params.merge(teacher_id: current_teacher.id))
      if @student.save
			  render json: @student.attributes.to_json
		  else
        render json: {errors:@student.errors}
      end
  end
  

  def index
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      @students = teacher.students
    else
       if params[:grade]
          @students = Student.search_by_grade(params[:grade])
        else
          @students = Student.includes(:teacher,:user)
        end
    end

  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      render json: @student.attributes.to_json
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
    if !@student
      redirect_to students_path
    end
  end

  def student_params
    params.require(:student).permit(:parent, :name, :grade, :email, :phone_number, :teacher_id, teacher_attributes: [:name, :search, :grade])
  end
end 
