class RatesController < ApplicationController

    def new
        @consultation = Consultation.find(params[:consultation_id])
        @doctor = params[:doctor_id]
        @rate = Rate.new
    end

    def create
        @rate = Rate.new(rate_params)
        if @rate.save!
            flash[:success] = "アンケートに回答しました"
            redirect_to user_path(current_user)
        else
            flash[:danger] = "アンケートの回答に失敗しました"
            redirect_to new_consultation_rate_path
        end
    end

    private
    def rate_params
        params.require(:rate).permit(:doctor_rate, :doctor_id, :consultation_id).merge(user_id: current_user.id)
    end
end
