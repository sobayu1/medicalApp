class RoomsController < ApplicationController

    def show
        @room = Room.find(params[:id])
        @consultation = @room.consultation
        @room_message = RoomMessage.new
        @room_messages = @room.room_messages
        if user_signed_in?
            if @consultation.user_id == current_user.id
                @doctor = @consultation.doctor
            else
                redirect_to user_path(current_user)
            end
        elsif doctor_signed_in?
            if @consultation.doctor_id == current_doctor.id
                @user = @consultation.user
            else
                redirect_to doctor_path(current_doctor)
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

end
