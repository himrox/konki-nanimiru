Capybara.register_driver :selenium do |app|
  # http://code.google.com/p/chromedriver/downloads/list
  # sudo mv ~/Downloads/chromedriver /usr/bin/
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end