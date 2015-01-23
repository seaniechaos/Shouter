require_relative 'shouter.rb'

describe User do
 before do
     @user = User.new
     @user.name = 'Sean'
     @user.handle = 'seaniechaos'
     @user.password = @user.generate_unique_password

     puts "Name:" + @user.name.to_s
 end

 describe "totally valid user" do
   it "should be valid because all data correct" do
         expect(@user.valid?).to be_truthy
   end
 end

 describe "name" do
   it "should be invalid if there is no name" do
       @user.name = nil
         expect(@user.valid?).to be_falsy
   end
 end

describe "handle" do
   it "should be invalid if there is no handle" do
        @user.handle = nil
         expect(@user.valid?).to be_falsy
   end
 end

 describe "password" do
   it "should be valid if password is less than 6 characters long" do
        @user.password = '12345'
         expect(@user.valid?).to be_falsy
   end
 end
end