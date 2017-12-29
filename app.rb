require 'sinatra'
require 'pg'
require 'pry'
require 'base64'

get '/' do
   erb :home 
end

get '/check_password' do
    password = params[:password] 
    connection = PG::Connection.new(:host => 'localhost', :port => 5432, :dbname => 'password_checker', :user => 'christian', :password => 'Fallbrook6197')
    results = connection.exec("SELECT password FROM compromised_passwords WHERE password = '#{Base64.encode64(password)}'")
    if results.values.empty?
        "Password: '#{password}' is not compromised."
    else
        "Password: '#{password}' is compormised!"
    end
end
