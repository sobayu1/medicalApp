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
