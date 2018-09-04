require 'pg'

class Peep
  attr_reader :id, :name, :user_name, :content, :date_posted
  def initialize(id:, name:, user_name:, content:, date_posted:)
    @id = id
    @name = name
    @user_name = user_name
    @content = content
    @date_posted = date_posted
  end

  def self.all
    peeps = env_check.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        name: peep['name'],
        user_name: peep['user_name'],
        content: peep['content'],
        date_posted: peep['date_posted']
      )
    end
  end

  def self.create(date_posted = Time.now.strftime('%D - %H:%M'), user:, content:)
    connection = env_check
    result = connection.exec("INSERT INTO peeps (name, user_name, content, date_posted) 
      VALUES('#{user.name}', '#{user.user_name}', '#{content}', '#{date_posted}')
      RETURNING id, name, user_name, content, date_posted;")
    Peep.new(
      id: result[0]['id'],
      name: result[0]['name'],
      user_name: result[0]['user_name'],
      content: result[0]['content'],
      date_posted: result[0]['date_posted']
    )
  end

  def self.feed
    feed = all.map { |peep| { content: peep.content, name: peep.name, date_posted: peep.date_posted } }
    feed.sort_by { |peep| peep[:date_posted] }.reverse
  end

  private
  def self.env_check
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end
end
