class ConsultationsController < ApplicationController
    before_action :set_target_consultation, only: %i[show destroy] 
    DISPLAYED＿RESULTS = 10

    def index
        if user_signed_in?
            @consultations = Consultation.where(user_id: current_user.id).page(params[:page]).per(ConsultationsController::DISPLAYED＿RESULTS)
        elsif doctor_signed_in?
            @consultations = Consultation.where(doctor_id: current_doctor.id).page(params[:page]).per(ConsultationsController::DISPLAYED＿RESULTS)
        else
            redirect_to root_path
        end
    end

    def new
        @consultation = Consultation.new
        @doctor = params[:doctor_id]
    end

    def create
        @consultation = Consultation.new(consultations_params)
        if  @consultation.save!
            if @room = Room.create!(consultation_id: @consultation.id)
                flash[:success] = "健康相談を受付けました" 
                redirect_to consultation_path(@consultation)
            end
        else
            flash[:danger] = "入力に誤りがあります"
            render new_consultation_path
        end
    end

    def show
        
    end

    def destroy
        @consultation.destroy
        redirect_to consultations_path(current_user), flash:{notice: "「#{@consultation.id}」の掲示板が削除されました"}
        
    end

    private

    def consultations_params
        params.require(:consultation).permit(:what_symptom, :when_symptom, :desease_treated, :desease_name, :specific_consultation, :doctor_id).merge(user_id: current_user.id )
    end

    def set_target_consultation
        @consultation = Consultation.find(params[:id])
    end
end
