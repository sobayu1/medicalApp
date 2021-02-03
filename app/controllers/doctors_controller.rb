class DoctorsController < ApplicationController
    DISPLAYED_RESULTS = 15

    def index 
        @doctors = params[:tag_id].present? ? Tag.find(params[:tag_id]).doctors : Doctor.all 
        @doctors = @doctors.page(params[:page]).per(DoctorsController::DISPLAYED_RESULTS)
    end

    def show
        @doctor = current_doctor
        @doctor_information = DoctorInformation.find_or_initialize_by(id: params[:id])
    end

    def review
        @doctor = Doctor.find(params[:doctor_id])
    end

end
