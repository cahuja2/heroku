class User < ActiveRecord::Base
has_many :rooms, :through => :reservations
has_many:reservations 
validates :name, presence: true
validates :email, presence: true, uniqueness: true
has_secure_password
validates :password, presence: true, length: { minimum: 6 }
end
