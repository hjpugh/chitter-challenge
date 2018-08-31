class Peep
  attr_reader :user, :user_name, :time_posted
  def initialize(user, time_posted = Time.now.strftime('%H:%M'))
    @user = user.name
    @user_name = user.user_name
    @time_posted = time_posted
  end
end
