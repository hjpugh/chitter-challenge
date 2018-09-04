require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    flash[:notice] = 'Unable to register, user name already in use.' if User.user_name_check(params[:user_name])
    flash[:notice] = 'Unable to register, email already in use.' if User.email_check(params[:email])
    session[:current_user] = User.sign_up(
                             name: params[:name],
                             user_name: params[:user_name],
                             email: params[:email],
                             password: params[:password]
                            )
    redirect('/')
  end

  post '/log_in' do
    flash[:notice] = 'Inavlid User Name' unless User.user_name_check(params[:user_name])
    if BCrypt::Password.new(User.return_user(params[:user_name]).password) == params[:password]
      session[:current_user] = User.return_user(params[:user_name])
      flash[:notice] = 'Login successful'
    else
      flash[:notice] = 'Login unsuccessful'
    end
    redirect('/')
  end

  post '/log_out' do
    session[:current_user] ? flash[:notice] = 'Logout successful' : flash[:notice] = 'Not logged in...' 
    session[:current_user] = nil
    redirect('/')
  end

  post '/new_peep' do
    session[:current_user].post(content: params[:content])
    redirect('/')
  end

  get '/peep_feed' do
    @peep_feed = Peep.feed
    @arr = @peep_feed.map { |p| {content: p[:content], name: p[:name], date_posted: p[:date_posted]} }
    erb(:peep_feed)
  end
end
