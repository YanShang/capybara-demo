# Testing a web site with Cucumber

To run the demo

    git clone git://github.com/yanshang/capybara-demo.git
    cd capybara-demo
    bundle install
    cucumber

Firefox and Safari webdrivers are included in Selenium-webdriver gem. Chrome and IE webdriver should be downloaded and copied to /usr/local/bin on Mac or C:\Windows on Windows.

To use interactive mode

On Mac

    $ IRBRC=./irbrc irb

On Windows

    > set IRBRC=./irbrc
    > irb
	
For example:

    >> Capybara.current_driver = :selenium_chrome
    >> Capybara.app_host = 'http://bing.com'
    >> visit '/'
    >> fill_in('q', :with=>'Pizza')
    >> click_on "sb_form_go"