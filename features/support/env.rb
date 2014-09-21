require 'capybara/cucumber'

Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :selenium_safari do |app|
    Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.register_driver :selenium_ie do |app|
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
end

#Capybara.app_host = "http://va32lappn174.mot.com:8080/productanalytics"
Capybara.app_host = "http://dl2k469v.am.mot-mobility.com:8080/productanalytics"
Capybara.default_driver = :selenium
Capybara.default_wait_time = 30