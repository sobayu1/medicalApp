class ConsultationsController < ApplicationController
    before_action :set_target_consultation, only: %i[show destroy] 
    def index
        @user = User.find(params[:user_id])
        @consultations = Consultation.all.page(params[:page]).per(5)
    end

    def new
        @user = User.find(params[:user_id])
        @consultation = Consultation.new
    end

    def create
        @consultation = Consultation.new(consultations_params)
        if @consultation.save!
            flash[:success] = "健康相談を受付けました" 
            redirect_to user_consultations_path
        else
            flash[:danger] = "入力に誤りがあります"
            render new_user_consultation_path
        end
    end

    def show
        @answer = Answer.new
        # @answer = Answer.find(params[:id])

    end

    def destroy
        @consultation.destroy
        redirect_to user_consultations_path(current_user), flash:{notice: "「#{@consultation.id}」の掲示板が削除されました"}
        
    end

    private

    def consultations_params
        params.require(:consultation).permit(:what_symptom, :when_symptom, :desease_treated, :desease_name, :specific_consultation).merge(user_id: current_user.id)
    end

    def set_target_consultation
        @consultation = Consultation.find(params[:id])
    end
end
