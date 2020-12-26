class RoomMessagesController < ApplicationController

    def create
        @room = Room.find(params[:room_id])
        @room_message = RoomMessage.new(room_message_params)

        if user_signed_in?
            @room_message.user_id = current_user.id
        elsif doctor_signed_in?
            @room_message.doctor_id = current_doctor.id
        end
        
        @room_message.room_id = @room.id


        if @room_message.save!
            redirect_to room_path(@room)
        else
            redirect_to room_path(@room)
        end
    end

    private
    def room_message_params
        params.require(:room_message).permit(:message_content)
    end

end
