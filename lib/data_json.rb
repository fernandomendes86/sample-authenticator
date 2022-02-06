require 'json'
require_relative 'bcrypt_auth'

module DataJson

  @data_users = [
    { username: "ruby", password: "blabla" },
    { username: "ruby2", password: "abcd1234" }
  ]

  def self.perform
    @data_users.each { |user| user[:password] = BCryptAuth.create_hash_digest(user[:password]) }
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