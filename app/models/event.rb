class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attendees, class_name: "User"
  has_many :rsvps, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :rsvps

  validates :title, :date, :location, :description, presence: true

  scope :past, -> { where("date < ?", Date.today) }
  scope :future, -> { where("date > ?", Date.today) }
end
