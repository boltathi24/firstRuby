require 'test/unit'

class BaseClass
  
  @driver;
  
    def setUpDriver

      path= File.dirname($0) + '/driver/geckodriver_Linux'
      
      Selenium::WebDriver::Firefox::Service::driver_path =path
      Selenium::WebDriver::Firefox.path='/home/local/ZOHOCORP/athithan-7130/firefox/firefox-bin'
     
      
    end
    
    def getDriver
      $driver=Selenium::WebDriver.for:firefox
      $driver.manage.window.maximize
      return $driver
    end
    
end