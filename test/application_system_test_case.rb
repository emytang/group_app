require "test_helper"
require "minitest/rails/capybara"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  driven_by :selenium, using: :headless_firefox, screen_size: [1400, 1400]
end
