# Load the Rails application.
require File.expand_path('../application', __FILE__)
DicisIo::Application.configure do
config.action_dispatch.ip_spoofing_check = false
end

# Initialize the Rails application.
DicisIo::Application.initialize!
