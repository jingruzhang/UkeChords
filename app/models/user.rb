class User < ActiveRecord::Base

    has_secure_password

    has_many :songs
    has_many :chores, :through => :songs

    validates :username, :password_digest, :presence => true

end