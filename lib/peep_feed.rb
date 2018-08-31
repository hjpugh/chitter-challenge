require 'pg'

class PeepFeed
  def self.feed
    connection = env_check
    peeps = connection.exec("SELECT * FROM peeps")
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

