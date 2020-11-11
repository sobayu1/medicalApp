class AnswersController < ApplicationController
    before_action :authenticate_doctor!
    
    def  create
        @answer = Answer.new(answer_params)
        if @answer.save!
            flash[:success] = "健康相談に回答しました"
            redirect_to user_consultations_path
        else
            flash[:danger] = "健康相談に回答できませんでした"
            redirect_back(fallback_location: root_path)
        end
    end
    
    private
    def answer_params
        params.permit(:answer_content).merge(doctor_id:current_doctor.id, consultation_id:params[:consultation_id])
    end
end