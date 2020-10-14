class AnswersController < ApplicationController
    before_action :authenticate_doctor!

    def  create
        @answer = current_doctor.answers.new(answer_params)
        # @answer.doctor_id = current_doctor.id
        # @answer.consultation_id = consultation.id
        # @answer.consultation_id = params[:consultation_id]
        # @answer.answer_content = params[:answer_content]
        binding.pry
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
        params.permit(:answer_content )  #require(:consultation)を削除
        # .merge(doctor_id: current_doctor.id ,consultation_id: consultation.id )
    end
end
