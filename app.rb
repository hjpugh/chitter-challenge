require 'sinatra/base'

require_relative './lib/user'
require_relative './lib/peep_feed'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/new_peep' do
    @user = User.new('H', 'hjp', 'hjp@gmail.com')
    @user.post(content: params[:content])
    redirect('/')
  end

  get '/peep_feed' do
    @peep_feed = PeepFeed.feed
    erb(:peep_feed)
  end
end
