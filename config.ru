require 'rubygems'
require 'bundler/setup'
require 'rack/google-analytics'
use Rack::GoogleAnalytics, :tracker => "UA-37814145-1"
require './app'
run Sinatra::Application