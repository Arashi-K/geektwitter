class MessagesController < ApplicationController

  after_action :update_chcecked, only: :index
  permits :content

  def index(user_id, room_id)
    @user=User.find(user_id)
    @room=Room.find(room_id)
    @message=Message.new
    @others_messages = @room.pair_room.messages
    @messages = @room.messages + @others_messages
    @messages.sort!{|a,b| a.created_at <=> b.created_at}
  end

  def create(user_id, room_id, message)
    @message = Message.new(message)
    @message.room = Room.find(room_id)
    @message.save
    redirect_to user_room_messages_path(user_id, room_id)
  end

  def destroy(user_id, room_id, id)
    Message.find(id).destroy
    redirect_to user_room_messages_path(user_id, room_id)
  end

  private
  def update_chcecked
    @others_messages.update_all(checked: true)
  end
end
