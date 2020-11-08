class DoctorsController < ApplicationController

    def index 
        @doctors = Doctor.all.page(params[:page]).per(15)
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
