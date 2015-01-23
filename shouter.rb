require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base

	has_many :shouts

  # we have name, handle, password

  PASSWORD_LENGTH = 6

  validates_presence_of :name, :handle, :password
  validate :password_length


  def generate_unique_password
    (0...PASSWORD_LENGTH).map { (65 + rand(26)).chr }.join.downcase
  end

  private

  def password_length
    if password.length < PASSWORD_LENGTH
      errors.add(:password, 'is too short')
    end
  end
end

class Shout < ActiveRecord::Base

	belongs_to :user

	INITIAL_LIKES = 0

	MIN_MESSAGE_LENGTH = 1
	MAX_MESSAGE_LENGTH = 200

	validates_presence_of :message, :created_at, :likes, :user_id
	validates_numericality_of :likes, greater_than_or_equal_to: 0
	validate :message_length

	def generate_created_at
		puts"b1"
	    now = DateTime.now
	    puts "b2 now: " + now.to_s
	    now
  	end

  	def initial_likes
  		INITIAL_LIKES
  	end

  	def message_length

  		if message.nil?
  			errors.add(:message, 'does not exist')
  		else

	  		if message.length < MIN_MESSAGE_LENGTH
	  			errors.add(:message, 'is too short')	
	  		end
	  		if message.length > MAX_MESSAGE_LENGTH
	  			errors.add(:message, 'is too long')	
	  		end
  	
  	end
  end
end

# shout.uesr = user
