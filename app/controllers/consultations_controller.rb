class ConsultationsController < ApplicationController
    before_action :set_target_consultation, only: %i[show destroy] 
    DISPLAYED＿RESULTS = 6

    def index
        @consultations = Consultation.all.page(params[:page]).per(ConsultationsController::DISPLAYED＿RESULTS)
    end

    def new
        @consultation = Consultation.new
    end

    def create
        @consultation = Consultation.new(consultations_params)
        if @consultation.save!
            flash[:success] = "健康相談を受付けました" 
            redirect_to consultations_path
        else
            flash[:danger] = "入力に誤りがあります"
            render new_consultation_path
        end
    end

    def show
        @answer = Answer.find_or_initialize_by(params[:id])
        @doctor = Doctor.find(params[:id])
        @user = User.find(params[:id]) 

        if user_signed_in?
            rooms = current_user.rooms
            @doctor_ids = []
            rooms.each do |r|
                @doctor_ids << r.doctor_id

            end

        elsif doctor_signed_in?
            rooms = current_doctor.rooms
            @user_ids = []
            rooms.each do |r|
                @user_ids << r.user_id
            end
        end
        

    end

    def destroy
        @consultation.destroy
        redirect_to consultations_path(current_user), flash:{notice: "「#{@consultation.id}」の掲示板が削除されました"}
        
    end

    private

    def consultations_params
        params.require(:consultation).permit(:what_symptom, :when_symptom, :desease_treated, :desease_name, :specific_consultation).merge(user_id: current_user.id)
    end

    def set_target_consultation
        @consultation = Consultation.find(params[:id])
    end
end
