class UserInformationsController < ApplicationController

    before_action :set_target_user_information, only: %i[edit update destroy] 

    
    def new
        @user = User.find(params[:user_id])
        @user_information = UserInformation.new
    end 

    def create
        @user_information = UserInformation.new(user_informations_params)
        if @user_information.save!
            flash[:success] = "健康情報を作成しました" 
            redirect_to user_path(current_user)
        else
            flash[:danger] = "入力に誤りがあります"
            render new_user_user_information_path
        end
    end
    
    def edit 
        @user = User.find(params[:id])

    end

    def update
        if @user_information.update(user_informations_params)
            flash[:success] = "健康情報を更新しました"
            redirect_to user_path(current_user)
        end
    end

    def destroy
    
    end
    
    private

    def user_informations_params
        params.require(:user_information).permit(:height,:weight ,:waist_circumference, :right_unaided_eyesight, :left_unaided_eyesight,
            :right_collected_vision, :left_collected_vision, :hearing, :maximum_blood_pressure, :minimum_blood_pressure,
            :hdl_cholesterole, :ldl_cholesterole, :neutral_fat, :ast, :alt, :gtp, :blood_sugar, :hba1c, :hemoglobin,
            :red_blood_cells,:chest_x_ray).merge(user_id: current_user.id)
    end

    def set_target_user_information
        @user_information = UserInformation.find(params[:id])
    end
end
