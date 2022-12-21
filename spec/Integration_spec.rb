# Generated by Selenium IDE

# require_relative 'models/user'
require_relative 'spec_helper'
require_relative 'rails_helper'
require 'selenium-webdriver'
require 'json'

describe 'TestCorrectRegistration' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'test Correct Registration' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:css, '.d-flex:nth-child(4) > #btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('SeleniumTest')
    @driver.find_element(:id, 'name').click
    @driver.find_element(:id, 'name').send_keys('SeleniumTest')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:id, 'pass_conf').click
    @driver.find_element(:id, 'pass_conf').send_keys('123')
    @driver.find_element(:id, 'mail').click
    @driver.find_element(:id, 'mail').send_keys('asd@asd.ru')
    @driver.find_element(:css, 'p > #btn').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.row > form') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.circular_image') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.row > img') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'btn') }
  end
  it 'test Correct Registration No.2' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:css, '.d-flex:nth-child(4) > #btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('SeleniumTest2')
    @driver.find_element(:id, 'name').click
    @driver.find_element(:id, 'name').send_keys('SeleniumTest2')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:id, 'pass_conf').click
    @driver.find_element(:id, 'pass_conf').send_keys('123')
    @driver.find_element(:id, 'mail').click
    @driver.find_element(:id, 'mail').send_keys('asd@asd.ru')
    @driver.find_element(:css, 'p > #btn').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.row > form') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.circular_image') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.row > img') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'btn') }
  end
end

describe 'Logged as admin' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'logged as admin' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:id, 'btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('Alex')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:css, 'p > #btn').click
    @driver.find_element(:css, 'form:nth-child(1) #btn').click
    @driver.find_element(:id, 'name').click
    @driver.find_element(:id, 'name').send_keys('New')
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    @driver.find_element(:css, '.container:nth-child(3) #btn').click
    @driver.find_element(:id, 'name').click
    @driver.find_element(:id, 'name').send_keys('Test')
    @driver.find_element(:id, 'content').click
    @driver.find_element(:id, 'content').send_keys('desc')
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    @driver.find_element(:css, '.container:nth-child(4) #btn').click
    @driver.find_element(:id, 'name').click
    @driver.find_element(:id, 'name').send_keys('Moderators')
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, 'form:nth-child(1) > p > #btn') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.navbar-nav > form > .btn') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.container:nth-child(2) > form #btn') }
  end
end

describe 'Logged as admin and can hide delete sections' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'logged as admin and can hide delete sections' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:id, 'btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('Alex')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:css, 'p > #btn').click
    @driver.find_element(:css, '.container:nth-child(2) > .container .col-auto:nth-child(1) #btn').click
    @driver.find_element(:css, '.container:nth-child(2) > .container .col-auto .col-auto:nth-child(2) #btn').click
    @driver.find_element(:css, '.container:nth-child(2) > .container .col-auto .col-auto:nth-child(2) #btn').click
    @driver.find_element(:css, '.container:nth-child(2) > .container .col-auto:nth-child(1) #btn').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.container:nth-child(2) .col-auto:nth-child(1) #btn') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.container:nth-child(2) .col-auto .col-auto:nth-child(2) #btn') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.container:nth-child(2) .col-auto:nth-child(3) .btn:nth-child(1)') }
  end
end

describe 'Loggedasadminandcanmakeanddeletemoder' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'logged as admin and can make and delete moder' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:id, 'btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('Alex')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:css, 'p > #btn').click
    @driver.find_element(:css, '.container:nth-child(2) > .container:nth-child(3) .col-auto:nth-child(3) .btn:nth-child(1)').click
    @driver.find_element(:css, '.row:nth-child(2) > .col #btn').click
    @driver.find_element(:css, '.row:nth-child(3) #btn').click
    element = @driver.find_element(:css, '.row:nth-child(3) #btn')
    @driver.find_element(:css, '.row:nth-child(2) > .col #btn').click
    @driver.find_element(:css, '#m-body .btn-close').click
    sleep(inspection_time=1)
    Selenium::WebDriver::Wait.new(timeout: 30)
    @driver.find_element(:css, '.navbar-nav > form > .btn').click
    @driver.find_element(:css, '.col > form > #btn').click
    sleep(inspection_time=1)
    @driver.find_element(:css, '#m-body .btn-close').click
    Selenium::WebDriver::Wait.new(timeout: 30)
    sleep(inspection_time=2)
    Selenium::WebDriver::Wait.new(timeout: 30).until {@driver.find_element(:css, '.container:nth-child(2) > .container:nth-child(3) .col-auto:nth-child(3) .btn:nth-child(1)')}
    @driver.find_element(:css, '.container:nth-child(2) > .container:nth-child(3) .col-auto:nth-child(3) .btn:nth-child(1)').click
    Selenium::WebDriver::Wait.new(timeout: 30)
    sleep(inspection_time=1)
    @driver.find_element(:css, '.row:nth-child(3) #btn').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.bg-warning:nth-child(2)') }
    @driver.find_element(:css, '#m-body .btn-close').click
    sleep(inspection_time=1)

    @driver.find_element(:css, '.container:nth-child(2) .col-auto:nth-child(1) #btn').click
  end
end


describe 'Logged as user and can create topic' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'loggedasuserandcancreatetopic' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:id, 'btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('SeleniumTest')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:css, 'p > #btn').click
    @driver.find_element(:link_text, 'Test').click
    @driver.find_element(:css, 'p > #btn').click
    @driver.find_element(:id, 'name').click
    @driver.find_element(:id, 'name').send_keys('Test topic #1')
    @driver.find_element(:id, 'content').click
    @driver.find_element(:css, 'form:nth-child(3)').click
    @driver.find_element(:css, '.trix-button--icon-bold').click
    element = @driver.find_element(:id, 'content')
    @driver.execute_script("if(arguments[0].contentEditable === 'true') {arguments[0].innerText = '<div><!--block--><strong>Hello world!</strong></div>'}", element)
    @driver.find_element(:css, 'form:nth-child(3) > #btn').click
    @driver.find_element(:css, '.bi').click
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:id, 'content') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, 'h1') }
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.navbar-nav > .btn') }
  end
end

describe 'Logged as user can create comments' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'loggedasusercancreatecomments' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.find_element(:id, 'btn').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').click
    @driver.find_element(:id, 'login').send_keys('SeleniumTest')
    @driver.find_element(:id, 'pass').click
    @driver.find_element(:id, 'pass').send_keys('123')
    @driver.find_element(:css, 'p > #btn').click
    @driver.find_element(:link_text, 'Test').click
    @driver.find_element(:css, 'strong').click
    @driver.find_element(:id, 'content').click
    element = @driver.find_element(:id, 'content')
    @driver.execute_script("if(arguments[0].contentEditable === 'true') {arguments[0].innerText = '<div><!--block-->Hello again!</div>'}", element)
    @driver.find_element(:css, '.field > #btn').click
    @driver.get('http://127.0.0.1:3000/section/1/topic/1')
    Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.overflow-hidden > .row:nth-child(2)') }
  end
end
  describe 'Logged as admin and can hide delete topics' do
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @vars = {}
    end
    after(:each) do
      @driver.quit
    end
    it 'logged as admin and can hide delete topics' do
      @driver.get('http://127.0.0.1:3000/')
      @driver.find_element(:id, 'btn').click
      @driver.find_element(:id, 'login').click
      @driver.find_element(:id, 'login').send_keys('Alex')
      @driver.find_element(:id, 'pass').click
      @driver.find_element(:id, 'pass').send_keys('123')
      @driver.find_element(:css, 'p > #btn').click
      @driver.find_element(:link_text, 'Test').click
      @driver.find_element(:css, '.p-1 > .col-auto:nth-child(2) #btn').click
      @driver.find_element(:css, '.p-1 > .col-auto:nth-child(2) #btn').click
      @driver.find_element(:css, '.p-1 > .col-auto:nth-child(1) #btn').click
      @driver.find_element(:css, '.p-1 > .col-auto:nth-child(1) #btn').click
      @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(1) #btn').click
      @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(2) #btn').click
      @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(2) #btn').click
      @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(1) #btn').click
      @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(1) #btn').click
      @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(2) #btn').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.justify-content-end > .col-auto:nth-child(2) #btn') }
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.bg-danger') }
    end
  end

  describe 'Trying to login and get alert' do
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @vars = {}
    end
    after(:each) do
      @driver.quit
    end
    it 'trying to login and geta lert No1' do
      @driver.get('http://127.0.0.1:3000/')
      @driver.find_element(:id, 'btn').click
      @driver.find_element(:id, 'login').click
      @driver.find_element(:id, 'login').send_keys('Asd')
      @driver.find_element(:id, 'pass').click
      @driver.find_element(:id, 'pass').send_keys('223')
      @driver.find_element(:css, 'p > #btn').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.alert') }
    end

    it 'trying to login and geta lert No2' do
      @driver.get('http://127.0.0.1:3000/')
      @driver.find_element(:id, 'btn').click
      @driver.find_element(:id, 'login').click
      @driver.find_element(:id, 'login').send_keys('')
      @driver.find_element(:id, 'pass').click
      @driver.find_element(:id, 'pass').send_keys('223')
      @driver.find_element(:css, 'p > #btn').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.alert') }
    end

    it 'trying to login and geta lert No3' do
      @driver.get('http://127.0.0.1:3000/')
      @driver.find_element(:id, 'btn').click
      @driver.find_element(:id, 'login').click
      @driver.find_element(:id, 'login').send_keys('Asd')
      @driver.find_element(:id, 'pass').click
      @driver.find_element(:id, 'pass').send_keys('')
      @driver.find_element(:css, 'p > #btn').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.alert') }
    end

    it 'trying to login and geta lert No4' do
      @driver.get('http://127.0.0.1:3000/')
      @driver.find_element(:id, 'btn').click
      @driver.find_element(:id, 'login').click
      @driver.find_element(:id, 'login').send_keys('Alex')
      @driver.find_element(:id, 'pass').click
      @driver.find_element(:id, 'pass').send_keys('223')
      @driver.find_element(:css, 'p > #btn').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.alert') }
    end
  end
  
  describe 'Tryingtoregisterandgetalert' do
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @vars = {}
    end
    after(:each) do
      @driver.quit
    end
    it 'tryingtoregisterandgetalert' do
      @driver.get('http://127.0.0.1:3000/')
      @driver.find_element(:css, '.d-flex:nth-child(4) > #btn').click
      @driver.find_element(:id, 'login').click
      @driver.find_element(:id, 'login').send_keys('ss')
      @driver.find_element(:id, 'name').click
      @driver.find_element(:id, 'name').send_keys('sd')
      @driver.find_element(:id, 'pass').click
      @driver.find_element(:css, 'p > #btn').click
      Selenium::WebDriver::Wait.new(timeout: 30).until { @driver.find_element(:css, '.alert') }
    end
  end
  