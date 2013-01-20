require 'rubygems'
require 'bundler/setup'

Google Analytics: UNCOMMENT IF DESIRED, THEN ADD YOUR OWN ACCOUNT INFO HERE!
require 'rack/google-analytics'
use Rack::GoogleAnalytics, :tracker => "UA-37814145-1"


require './app'
run Sinatra::Application