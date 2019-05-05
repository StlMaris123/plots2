require "application_system_test_case"
# https://guides.rubyonrails.org/testing.html#implementing-a-system-test

class ScreenshotsTest < ApplicationSystemTestCase
  test 'front page with navbar search autocomplete' do
    visit '/'

    fill_in("searchform_input", with: "Canon")
    
    # could try http://blog.mechanicles.com/2018/03/04/gotchas-rails-system-testing.html for "waiting"
    # or sleep(5.seconds) but this might just freeze everything
    # or assert_select ".selector", wait: 5 # i think...
    # or https://robots.thoughtbot.com/automatically-wait-for-ajax-with-capybara

    # apparently this will wait for ajax to complete? 
    # also, not sure we can nest css like this:
    assert_select "ul.dropdown-menu li", count: 2 #, wait: 5

    # this is cool: 
    # page.evaluate_script('jQuery.active').zero?

    take_screenshot
    # we set RAILS_SYSTEM_TESTING_SCREENSHOT to 'inline', could be 'artifact' too... see Rails API guide
  end
end