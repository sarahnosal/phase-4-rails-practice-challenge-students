class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        students = Student.all
        render json: students
    end 

    def show
        student = Student.find(params[:id])
        render json: student
    end

    def create
        student = Student.create!(student_params)
        render json: student
    end

    def update
        student = Student.find(params[:id]).update!(student_params)
        render json: student
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        head :no_content
    end

    private 

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def render_invalid_record(exception)
        render json: {error: exception.record.invalid.error}, status: :unprocessable_entity
    end

    def render_not_found
        render json: { error: "Student not found"}, status: :not_found
    end
end
