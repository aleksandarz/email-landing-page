require 'rubygems'
require 'sinatra'
require 'hominid' # MailChimp

configure do

  # MailChimp configuration: ADD YOUR OWN ACCOUNT INFO HERE!
  set :mailchimp_api_key, "98a4f75e49598eb5a3af403d11db121c-us6"
  set :mailchimp_list_name, "Landing"

end

get '/' do
  File.read(File.join('public', 'index.html'))
end

post '/signup' do
  email = params[:email]
  unless email.nil? || email.strip.empty?
    mailchimp = Hominid::API.new(settings.mailchimp_api_key)
    list_id = mailchimp.find_list_id_by_name(settings.mailchimp_list_name)
    raise "Unable to retrieve list id from MailChimp API." unless list_id
    mailchimp.list_subscribe(list_id, email, {'FNAME' => 'Joe', 'LNAME' => 'Public'}, 'html', false, true, true, false)
  end
  "Success."
end
