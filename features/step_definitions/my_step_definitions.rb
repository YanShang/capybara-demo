Given /^I start (Chrome|Safari|Firefox|IE) browser$/ do |browser|
  Capybara.current_driver = {"Chrome"=>:selenium_chrome, "Safari"=>:selenium_safari, "IE"=>:selenium_ie}.fetch(browser, :selenium)
end

Given /^I am on the login page$/ do
  visit('/')
end

Then /^I wait for (\d+) second(?:|s)$/ do |seconds|
  sleep(seconds.to_i)
end

Then /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

Then /^I press the "([^\"]*)" button$/ do |button|
  find_button(button).click
end

Then /^I enter my credentials$/ do
  step %{I fill in "username" with "xxx"}
  step %{I fill in "j_password" with "xxx"}
end

Then /^I log in with my credentials$/ do
  step %{I enter my credentials}
  step %{I press the "Login" button}
end

Then /^I enter item number "([^\"]*)"$/ do |item_number|
  step %{I fill in "searchFieldsWithDelimiterSupport['partNumber']" with "#{item_number}"}
end

Then /^I select region "([^\"]*)"$/ do |region|
  step %{I select "#{region}" from "searchRegions"}
end
	
Then /^I follow the "([^\"]*)" link$/ do |text|
  find_link(text).click
end

Then /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

Then /^I check "([^\"]*)"$/ do |field|
  check(field)
end

Then /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

Then /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

Then /^I should see part number "([^\"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should see "([^\"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should_not have_content(regexp)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should_not =~ /#{value}/
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  find_field(label).should be_checked
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  find_field(label).should_not be_checked
end

Then /^I go to next page$/ do
  begin
    page.find(:xpath, '//td[@class="x-toolbar-cell"]//button')
  rescue
  end
  page.all(:xpath, '//td[@class="x-toolbar-cell"]//button')[2].click
end