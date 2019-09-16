class Tweet < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  belongs_to :user
  has_many :likes
  has_many :comments
  #Timeline End
end
