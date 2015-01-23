require_relative 'shouter.rb'

@user = User.new
@user.name = 'Sean'
@user.handle = 'seaniechaos'
@user.password = @user.generate_unique_password

@user.save