require 'bcrypt'

module BCryptAuth
  include BCrypt

  def self.create_hash_digest(password)
    Password.create(password)
  end

  def self.new_hash_digest(password)
    Password.new(password)
  end
end