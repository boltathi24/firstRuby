require 'selenium-webdriver'
require_relative 'util.rb'

class Page < Util
  
#
#  def initialize
#
#    Selenium::WebDriver::Firefox::Service::driver_path ='/home/local/ZOHOCORP/athithan-7130/driver/geckodriver_Linux'
#    Selenium::WebDriver::Firefox.path='/home/local/ZOHOCORP/athithan-7130/firefox/firefox-bin'
#    $driver=Selenium::WebDriver.for:firefox
#    $driver.manage.window.maximize
#   
#  end
  

  
  def chooseLocationOfServiceRequired(location)
     clearValue(customFindElement(:name,'postal_code_input'))
     insertValue(customFindElement(:name,'postal_code_input'),location)
     clickOnElement( customFindElement(:xpath,"//div[contains(@class,'autocomplete-suggestions angucomplete-dropdown')]//div[@data-val='#{location}']"))
  end
  
  
  def clickOnGoBtnForLocationSearch()
    clickOnElement(customFindElement(:xpath,"//button[contains(@class,'blue go')]"))     
   end
   
   def insertInfoForPlumber(val)
     insertValue(customFindElement(:xpath,"//div[contains(@class,'commonTextField')]//textArea"),val)
   end
   
   
   
  def clearInfoForPlumber
      clearValue(customFindElement(:xpath,"//div[contains(@class,'commonTextField')]//textArea"))
    end
    
  def chooseWhenToComeForService(val)
      clickOnElement(customFindElement(:xpath,"//div[text()='#{val}']//ancestor::label"))
#      customFindElement(:xpath,"//div[text()='On a specific date']//ancestor::label").click
    end
   
  def chooseDateOfService(date)
      date=getDateAfterAddingDays(2)
      selectMonth(getMonthAfterAddingDays(2))
      clickOnElement(customFindElement(:xpath,"//button[@aria-label='#{date}']"))
      
    end
    
  
  def clickOnNxtBtn
    clickOnElement(customFindElement(:xpath,"//button[@data-test='next_button']"))
     
    end
    
    def waitForVerifyPhoneButton
      waitUntil(:xpath,"//button[contains(@class,'successButton')]")
    end
    
    def chooseTimeOfService(time)
    Selenium::WebDriver::Support::Select.new(customFindElement(:xpath,"//select[@data-test='step_time']")).select_by(:text, time)  
    end
    
    def selectCheckBoxValue(val)
      clickOnElement(customFindElement(:xpath,"//div[contains(@class,'styles__checkBox')]//parent::*//following-sibling::div[text()='#{val}']"))
      
    end
    
    def getCurrentMonthCalendar
      return getTextValue(customFindElement(:xpath,"//div[contains(@class,'CalendarMonth CalendarMonth') and @data-visible='true']"))
    end
    
    def selectMonth(month)
     while !month.casecmp(getCurrentMonthCalendar) do
      clickOnElement(customFindElement(:xpath,"//div[contains(@class,'commonInputContaine')]//i[contains(@class,'nextIcon')]"))
     end
    end

    def insertEmail(email)
      time=getCurrentTime
      insertValue(customFindElement(:xpath,"//input[@data-test='step_email']"),email+time+"@gmail.com")
    end
    
  def insertFullName(name)
      insertValue(customFindElement(:xpath,"//input[@data-test='step_name']"),name)
    end
    
  def insertPassword(pwd)
        insertValue(customFindElement(:xpath,"//input[@data-test='step_password']"),name)
      end
    
    
end