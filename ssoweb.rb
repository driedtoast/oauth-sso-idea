require 'rubygems'
require 'sinatra'
require 'oauth2'
require 'json'
require 'cgi'
require 'rack/session/cookie' 

$:.unshift File.expand_path('../', __FILE__)
require 'lib/oauthactions.rb'
require 'lib/ssoutil.rb'

$stdout.sync = true

use Rack::Session::Cookie, :key => 'rack.session',
                               :domain => '127.0.0.1',
                               :path => '/',
                               :expire_after => 2592000,
                               :secret => 'session_key'

get '/' do
  ## @access_token.get("#{$config['scim_path']}").parse
  # figure sso click
  # resultList = @access_token.get("#{$config['sso_path']}").parsed
  erb :index
end

post '/action' do
  # @user = @access_token.post("#{$config['sso_path']}").parsed
  # do redirect
  @result = Hash.new 
  @result['code'] = params[:code]
  @result['access_token'] = session['access_token']
  done = :done
  erb done
end



