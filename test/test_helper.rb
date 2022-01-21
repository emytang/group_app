ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest/rails"

# require "minitest/reporters"
# Minitest::Reporters.use!

# require 'capybara/rails'
# require 'capybara/minitest'
# require 'webdrivers'

# from selenium import webdriver
# from selenium.webdriver.chrome.options import Options

# options = Options()
# options.binary_location = "C:\\Program Files\\Chrome\\chrome64_55.0.2883.75\\chrome.exe"
# driver = webdriver.Chrome(chrome_options = options, executable_path=r'C:\path\to\chromedriver.exe')
# driver.get('http://google.com/')
# print("Chrome Browser Invoked")
# driver.quit()

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
end
