class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor
    end

    def update
        instructor = Instructor.find(params[:id]).update!(instructor_params)
        render json: instructor
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def render_invalid_record(exception)
        render json: {error: exception.record.invalid.error}, status: :unprocessable_entity
    end

    def render_not_found
        render json: { error: "Instructor not found"}, status: :not_found
    end
end
