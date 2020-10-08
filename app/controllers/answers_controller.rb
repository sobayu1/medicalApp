class AnswersController < ApplicationController
    before_action :authenticate_doctor!

    def  create
        consultation = Consultation.find(params[:id])
        answer_params(consultation)
        @answer = Answer.new(answer_params(consultation))
        @answer.doctor_id = current_doctor.id
        @answer.consultation_id = consultation.id
        if @answer.save
            flash[:success] = "健康相談に回答しました"
            redirect_to user_consultations_path
        else
            flash[:danger] = "健康相談に回答できませんでした"
            redirect_back(fallback_location: root_path)
        end
        binding.pry
    end


    private
    def answer_params(consultation)
        params.require(:answer).permit(:answer_content).merge(doctor_id: current_doctor.id ,consultation_id: consultation.id)
    end
end
