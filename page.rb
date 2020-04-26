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
   
  def chooseDateOfService(dayToAdd)   
    date=getDateAfterAddingDays(dayToAdd)
      selectMonth(getMonthAfterAddingDays(dayToAdd))
      clickOnElement(customFindElement(:xpath,"//button[@aria-label='#{date}']"))
      
    end
    

    
  
  def clickOnNxtBtn
    clickOnElement(customFindElement(:xpath,"//button[@data-test='next_button' and not(contains(@class,'is-working'))]"))
      
     
    end
    
    def verifyPhoneButtonPresence
      waitUntil(:xpath ,"//button[@data-test='verify_button']")
      raise "Phone number Not displayed" unless isElementDisplayed(:id ,"PHONE_NUMBER")
      raise "Text of Button in Phone number Field is incorrect" unless  getTextValue(customFindElement(:xpath,"//button[@data-test='verify_button']")).include?("Verify")
    end
    
    def chooseTimeOfService(time)
    Selenium::WebDriver::Support::Select.new(customFindElement(:xpath,"//select[@data-test='step_time']")).select_by(:text, time)  
    end
    
    def selectCheckBoxValue(val)
      clickOnElement(customFindElement(:xpath,"//div[contains(@class,'styles__checkBox')]//parent::*//following-sibling::div[contains(text(),'#{val}')]"))
      
    end
    
    def getQstn
      
      waitForProgressBar
      return getTextValue(customFindElement(:xpath,"//div[contains(@class,'popup__content')]//div[contains(@class,'commonFormTitle') or contains(@class,'titleBase')]"))
    end
    
    def isElementDisplayed(locator,value)
      
      if(customFindElements(locator,value).size>0 && customFindElement(locator,value).displayed?)
        return true
      else
        return false 
      end
    end
    
    def waitForQstnToChange(prevQstn)
      i=1
             while(prevQstn.include?getQstn)
             waitForProgressBar      
             sleep(1)
             i=i+1
             if(i>30)         
                 break
             end
             end
    end
    
    
    def navigateUserChoice(hash)
      waitForProgressBar
      prevQstn="*****************"
      while isElementDisplayed(:xpath,"//div[contains(@class,'popup__content')]//div[contains(@class,'commonFormTitle') or contains(@class,'titleBase')]")
        
        waitForQstnToChange(prevQstn)
        prevQstn=getQstn
        qstn=getQstn
        val =hash[qstn]
        
#      if qstn.include?("Get responses faster with SMS notifications.")
#                    
#                      verifyPhoneButtonPresence 
#                      break
#               end
        
      if isElementDisplayed(:xpath,"//button[@data-test='verify_button']")
                         
                           verifyPhoneButtonPresence 
                           break
                    end
        
      
        
        if hash.key?  qstn 
          if qstn.include?("Plumber needs to know?")
            insertInfoForPlumber(val)
            clearInfoForPlumber
            
            elsif qstn.include?("When do you require plumbing?")
            chooseWhenToComeForService(val)
            
            elsif qstn.include?("On what date?")
            chooseDateOfService(val) 
            
            elsif qstn.include?("Where would you like us to notify you about new quotes received on your request?")
            insertEmail(val) 
            
            elsif qstn.include?("Please introduce yourself")
            insertFullName(val)                    
                       
            elsif qstn.include?("What time do you need the Plumber?")
             chooseTimeOfService(val)
                                           
            else
            selectCheckBoxValue(val)
          end
#          
       else 
          if  isElementDisplayed(:xpath,"//div[contains(@class,'styles__checkBox')]//parent::*//following-sibling::div")
          selectCheckBoxValue("")
          end
        end
      
      
     
      
      clickOnNxtBtn()
      waitForProgressBar()
      
      end
    end
        
        
    
     def waitForProgressBar
       waitUntil(:xpath,"//div[contains(@class,'topBase')]")
     
     end
     
     
    
    
    def getCurrentMonthCalendar
      return getTextValue(customFindElement(:xpath,"//div[contains(@class,'CalendarMonth CalendarMonth') and @data-visible='true']//div[contains(@class,'CalendarMonth_caption')]"))
    end
    
  
    
    def selectMonth(month)     
         
      while(!(month.casecmp(getCurrentMonthCalendar)==0))
        
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