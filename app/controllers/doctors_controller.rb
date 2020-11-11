class DoctorsController < ApplicationController
    DISPLAYED_RESULTS = 15

    def index 
        @doctors = Doctor.all.page(params[:page]).per(DoctorsController::DISPLAYED_RESULTS)
        # TODO:doctor_informationをindexに反映
        # @doctor_information = DoctorInformation.find(params[:id])
    end

    def show
        @doctor = current_doctor
        @doctor_information = DoctorInformation.find(params[:id])
    end

    def edit
        @doctor = Doctor.find(params[:id])
    end

    # private 
    # def doctor_params
    #     params.require(:doctor).permit(:image)
    # end
end
