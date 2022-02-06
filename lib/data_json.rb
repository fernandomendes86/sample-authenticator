require 'json'
require 'bcrypt'

module DataJson
  include BCrypt
  # generate hash 
  password_hash = Password.create("blabla")
  password_hash2 = Password.create("abcd1234")

  @data_users = [
    { username: "ruby", password: password_hash },
    { username: "ruby2", password: password_hash2 }
  ]

  def self.perform
    write_json(@data_users)
    load_json
  end
  
  def self.write_json(data)
    File.open('./data/credentials.json', 'w') do |file|
      file.write(JSON.dump(data))
    end
  end

  def self.load_json
    JSON.parse(File.read('./data/credentials.json'), symbolize_names: true)
  end

end