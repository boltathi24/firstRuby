require_relative 'page.rb'
require_relative 'util.rb'
class TestClasses < Page
  
  
  def validateCustomRegForm
    setUpDriver
    $driver=getDriver
    navigateUrl("https://www.starofservice.in/dir/telangana/hyderabad/hyderabad/plumbing#/")
    chooseLocationOfServiceRequired("Chennai")
    clickOnGoBtnForLocationSearch
    clickOnNxtBtn
    selectCheckBoxValue("Tap")
    clickOnNxtBtn
    selectCheckBoxValue("Replace")
    clickOnNxtBtn
    selectCheckBoxValue("Leak in a pipe")
    clickOnNxtBtn
    insertInfoForPlumber("Tips for Plumber")
    clearInfoForPlumber
    
    clickOnNxtBtn
    
   chooseWhenToComeForService("On a specific date")
   clickOnNxtBtn
      
   chooseDateOfService("Monday, April 27, 2020")
    
   clickOnNxtBtn
   
   chooseTimeOfService("03:00")
    
   clickOnNxtBtn
   
    insertEmail("test")
    
    
#    clickOnNxtBtn()
#    
#    insertPassword("Sample Pass")
    
        
            
     clickOnNxtBtn()
      
    insertFullName("Test Sample")
    
        
     clickOnNxtBtn()
        
   waitForVerifyPhoneButton
     
   close_browser()
    
  end
  
end