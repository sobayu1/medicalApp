class RatesController < ApplicationController

    def new
        @rate = Rate.new
        @doctor = params[:doctor_id]
    end

    def create
        @rate = Rate.new(rate_params)
        if @rate.save!
            flash[:success] = "アンケートに回答しました"
            redirect_to user_path(current_user)
        else
            flash[:danger] = "アンケートの回答に失敗しました"
            redirect_to new_rate_path
        end

    end

    private
    def rate_params
        params.require(:rate).permit(:doctor_rate, :doctor_id).merge(user_id: current_user.id )
    end
end
