require 'pg'
require 'bcrypt'
require_relative 'peep'

class User
  attr_reader :id, :name, :user_name, :email, :password
  def initialize(id:, name:, user_name:, email:, password:)
    @id = id
    @name = name
    @user_name = user_name
    @email = email
    @password = password
  end

  def self.all
    users = env_check.exec("SELECT * FROM users")
    users.map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        user_name: user['user_name'],
        email: user['email'],
        password: user['password']
      )
    end
  end

  def self.sign_up(name:, user_name:, email:, password:)
    return nil if user_name_check(user_name) || email_check(email)
    encrypted_pword = BCrypt::Password.create(password)
    connection = env_check
    result = connection.exec("
              INSERT INTO users (name, user_name, email, password)
              VALUES('#{name}', '#{user_name}', '#{email.downcase}', '#{encrypted_pword}')
              RETURNING id, name, user_name, email, password;"
              )
    user_create(result)
  end

  def self.return_user(user_name)
    result = env_check.exec("SELECT * FROM users WHERE USER_NAME = '#{user_name}';")
    user_create(result)
  end

  def self.password_check(user_name, password)
    result = env_check.exec("SELECT * FROM users WHERE USER_NAME = '#{user_name}';")
    user_create(result).password == password
  end

  def post(peep = Peep, content: nil)
    peep = peep.create(user: self, content: content)
  end

  private
  def self.env_check
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.user_create(result)
    user = User.new(
           id: result[0]['id'],
           name: result[0]['name'],
           user_name: result[0]['user_name'],
           email: result[0]['email'],
           password: result[0]['password']
           )
    user
  end

  def self.user_name_check(user_name)
    !env_check.exec("SELECT * FROM users WHERE USER_NAME = '#{user_name}';").map { |name| name }.empty?
  end

  def self.email_check(email)
    !env_check.exec("SELECT * FROM users WHERE EMAIL = '#{email.downcase}';").map { |email| email }.empty?
  end
end
