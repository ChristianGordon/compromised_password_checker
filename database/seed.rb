require 'pg'
require "base64"
require 'pry'

connection = PG::Connection.new(:host => 'localhost', :port => 5432, :dbname => 'password_checker', :user => 'christian', :password => 'Fallbrook6197')

File.open("rockyou.txt").each_with_index do |line, index|
    break if index > 100 
    connection.exec("INSERT INTO compromised_passwords (password) VALUES ('#{Base64.encode64(line.strip)}')")
end
connection.close
