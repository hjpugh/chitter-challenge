require_relative 'peep'

class User
  attr_reader :name, :user_name, :email
  def initialize(name, user_name, email)
    @name = name
    @user_name = user_name
    @email = email
  end

  def post(peep = Peep, content: nil)
    peep = peep.create(user: self, content: content)
  end
end

# us = User.new('H', 'hjp', 'hjp@gmail.com')
# us.post(content: 'hello')
# p Peep.all
