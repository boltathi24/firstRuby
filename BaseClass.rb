class BaseClass
  
  @driver;
  
    def setUpDriver
      puts "/home/local/ZOHOCORP/athithan-7130/eclipse-workspace/vivritiCodingChallenge/driver/geckodriver_Linux"
       path="/home/local/ZOHOCORP/athithan-7130/eclipse-workspace/vivritiCodingChallenge/driver/geckodriver_Linux"
       
      Selenium::WebDriver::Firefox::Service::driver_path =path
      Selenium::WebDriver::Firefox.path='/home/local/ZOHOCORP/athithan-7130/firefox/firefox-bin'
     
      
    end
    
    def getDriver
      $driver=Selenium::WebDriver.for:firefox
      $driver.manage.window.maximize
      return $driver
    end
    
end