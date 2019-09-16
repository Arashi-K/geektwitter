class User < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  has_many :tweets
  has_many :likes
  has_many :comments
  has_many :user1_rooms, class_name: 'Room', foreign_key: 'user1_id'
  has_many :user2_rooms, class_name: 'Room', foreign_key: 'user2_id'
  has_many :from_user_follows, class_name: 'Follow', foreign_key: 'from_user_id'
  has_many :to_user_follows, class_name: 'Follow', foreign_key: 'to_user_id'
  #Timeline End

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
