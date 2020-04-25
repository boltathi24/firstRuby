require_relative 'BaseClass.rb'
require 'time'
require 'date'
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
        
  def getTextValue(element)
          return  element.text
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
    
def getCurrentTime
     return Time.new.strftime("%Y%m%d%H%M%S")
  
    end
    
  def getDateAfterAddingDays(numberOfDays)
#    time=DateTime.now
#    
#    time.advance(days: 2)
    
    t=Time.now
    d=Date.parse(t.to_s)
    d=d+3
    time=Time.parse(d.to_s)
    return time.strftime("%A, %B %-d, %Y")
  end
  
def getMonthAfterAddingDays(numberOfDays)
  t=Time.now
      d=Date.parse(t.to_s)
      d=d+3
    time=  Time.parse(d.to_s)
    return time.strftime("%B")
  end
    
end