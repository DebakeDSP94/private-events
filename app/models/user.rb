class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_person_name
  has_many :events
  has_many :rsvps, foreign_key: :invited_event_id
  has_many :attended_events, through: :rsvps 
end
