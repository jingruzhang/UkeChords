class User < ActiveRecord::Base

    extend Slugifiable::ClassMethods

    has_secure_password

    has_many :songs
    has_many :chords, :through => :songs

    validates :username, :password_digest, :presence => true

    def slug
        self.username.gsub(" ", "-").downcase
    end
end