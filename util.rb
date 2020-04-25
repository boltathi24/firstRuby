require_relative 'BaseClass.rb'
class Util < BaseClass
  
  def customFindElement(locator,value)
        waitUntil(locator,value)
        return  $driver.find_element(locator,value)
      end
      
      def insertValue(element ,value)
        element.send_keys(value)
      end
      
    def clearValue(element )
         element.clear
       end
      
    def clickOnElement(element)
          element.click
        end
    
    def waitUntil(locator,value)
       Selenium::WebDriver::Wait.new(:timeout => 10).until{$driver.find_element(locator,value).displayed?}
         
       end
       
def navigateUrl(url)
  $driver.get(url)
end
    
    def close_browser
      $driver.quit
    end
    
end