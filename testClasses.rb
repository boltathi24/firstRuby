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
    
    
    userChoice = Hash.new
    userChoice["The problems are to do with which of the following things?"] = "Tap"
    userChoice["What do you need done?"] = "Replace"
    userChoice["What problem(s) do you have?"] = "Leak in a pipe"
    userChoice["Is there anything else that the Plumber needs to know?"] = "Test Tips For Plumber"
    userChoice["When do you require plumbing?"] = "On a specific date"
    userChoice["On what date?"] = 2
    userChoice["What time do you need the Plumber?"] = "06:00"
    userChoice["Where would you like us to notify you about new quotes received on your request?"] = "testemail"
    userChoice["Please introduce yourself"] = "test user"
    navigateUserChoice(userChoice)
    
#    sleep(30)
#    selectCheckBoxValue("Tap")
#    clickOnNxtBtn
#    selectCheckBoxValue("Replace")
#    clickOnNxtBtn
#    selectCheckBoxValue("Leak in a pipe")
#    clickOnNxtBtn
    
    
#    insertInfoForPlumber("Tips for Plumber")
#    clearInfoForPlumber
#    
#    clickOnNxtBtn
#    
#   chooseWhenToComeForService("On a specific date")
#   clickOnNxtBtn
#      
#   chooseDateOfService(40)
#    
#   clickOnNxtBtn
#   
#   chooseTimeOfService("03:00")
#    
#   clickOnNxtBtn
#   
#    insertEmail("test")
#    
#    
##    clickOnNxtBtn()
##    
##    insertPassword("Sample Pass")
#    
#        
#            
#     clickOnNxtBtn()
#      
#    insertFullName("Test Sample")
#    
#        
#     clickOnNxtBtn()
#        
#   waitForVerifyPhoneButton
     
   close_browser()
    
  end
  
end