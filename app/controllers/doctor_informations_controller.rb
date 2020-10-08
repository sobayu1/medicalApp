class DoctorInformationsController < ApplicationController
        before_action :set_target_doctor_information, only: %i[edit update destroy] 
    
        
        def new
            @doctor = Doctor.find(params[:id])
            @doctor_information = DoctorInformation.new
        end 
    
        def create
            @doctor_information = DoctorInformation.new(doctor_informations_params)
            if @doctor_information.save!
                flash[:success] = "医師情報を登録しました" 
                redirect_to doctor_path(current_doctor)
            else
                flash[:danger] = "入力に誤りがあります"
                render new_doctor_doctor_information_path
            end
        end
        
        def edit 
            @doctor = Doctor.find(params[:id])
    
        end
    
        def update
            if @doctor_information.update(doctor_informations_params)
                flash[:success] = "医師情報を更新しました"
                redirect_to doctor_path(current_doctor)
            end
        end
    
        def destroy
        
        end
        
        private
    
        def doctor_informations_params
            params.require(:doctor_information).permit(:hospital,:specialty ,:career).merge(doctor_id: current_doctor.id)
        end
    
        def set_target_doctor_information
            @doctor_information = DoctorInformation.find(params[:id])
        end
end




    

