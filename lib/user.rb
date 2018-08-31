require_relative 'peep'

class User
  attr_reader :name, :user_name, :email
  def initialize(name, user_name, email)
    @name = name
    @user_name = user_name
    @email = email
  end

  def post(peep = Peep.new(self))
    peep = peep
  end
end

# us = User.new('H', 'hjp', 'hjp@gmail.com')
# p us.post
