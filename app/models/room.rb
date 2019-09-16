class Room < ApplicationRecord
  has_many :messages
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id'
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id'
  belongs_to :pair_room, class_name: 'Room', foreign_key: 'pair_room_id'
  has_one :pair_room_room, class_name: 'Room', foreign_key: 'pair_room_id'
end
