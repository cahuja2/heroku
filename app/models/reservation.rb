class Reservation < ActiveRecord::Base
belongs_to :user
belongs_to :room
validates_uniqueness_of :room_name, :scope => [:date, :slot]
validates :date, :inclusion => {:within => Date.today...(Date.today + 7.days).end_of_day}
end
