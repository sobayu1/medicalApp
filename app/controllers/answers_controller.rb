class AnswersController < ApplicationController
    before_action :authenticate_doctor!

    def  create
        # @consultation = Consultation.find(params[:consultation_id])
        @answer = Answer.new(answer_params)
        @answer.doctor_id = current_doctor.id
        @answer.consultation_id = params[:consultation_id]
        if @answer.save!
            flash[:success] = "健康相談に回答しました"
            redirect_to user_consultations_path
        else
            flash[:danger] = "健康相談に回答できませんでした"
            redirect_back(fallback_location: root_path)
        end
        binding.pry
    end


    private
    def answer_params
        params.permit(:answer_content).merge(doctor_id:current_doctor.id, consultation_id:params[:consultation_id])
    end
end
