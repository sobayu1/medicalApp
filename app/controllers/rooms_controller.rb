class RoomsController < ApplicationController
    before_action :set_target_consultation
    
    def show
        @room = Room.find_or_initialize_by(params[:consultation_id])
        @room_message = RoomMessage.new
        @room_messages = @room.room_messages
        if user_signed_in?
            if @room.user.id == current_user.id
                @doctor = @room.doctor
            else
                redirect_to "/"
            end
        elsif doctor_signed_in?
            if @room.doctor.id == current_doctor.id
                @user = @room.user
            else
                redirect_to "/"
            end
        else
            redirect_to "/"
        end 
    end

    private

    def room_doctor_params
        params.require(:room).permit(:doctor_id)
    end

    def room_user_params
        params.require(:room).permit(:user_id)
    end

    def set_target_consultation
        @consultation = Consultation.find_or_initialize_by(params[:id])
    end


end
