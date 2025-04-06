class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_events, foreign_key: :creator_id, class_name: "Event", inverse_of: "creator", dependent: :destroy
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event
end
