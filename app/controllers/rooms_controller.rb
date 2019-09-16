class RoomsController < ApplicationController
  def index
    @rooms=current_user.user1_rooms
  end

  def create(user_id)
    user = User.find(user_id)
    @room1 = Room.create(user1: current_user, user2: user)

    @room2 = Room.create(user1: user, user2: current_user)

    @room1.pair_room = @room2
    @room2.pair_room = @room1
    if @room1.save && @room2.save
      redirect_to user_room_messages_path(user_id, @room1.id)
    else
      redirect_to user_path(user_id)
    end
  end
end
