require 'bcrypt'
require './lib/data_json'

puts "Welcome to the authenticator"
25.times {print "-"}
puts
puts "This is program will take input from the user and compare password"
puts

users = DataJson.perform

def authenticate_user(username, password, users)
  users.each do |user| 
    return user if user[:username] == username && BCrypt::Password.new(user[:password]) == password
  end
  "Credentials were not correct!"
end

def gets_credentials
  print "Username: "
  username = gets.chomp.downcase
  print "Password: "
  password = gets.chomp.downcase
  return username, password
end

continue = ""
3.times do 
  username, password = gets_credentials
  puts
  puts authenticate_user(username, password, users)
  print "Press n to quit or any other key to continue: "
  continue = gets.chomp.downcase  
  break if continue == "n" 
end
puts "You have exceeded the number of attempts!" if continue != "n"
