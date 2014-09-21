Feature: BOM search in WPA
   
Scenario: Search using Chrome
  Given I start Chrome browser
    And I am on the login page
   When I log in with my credentials
    And I follow the "Bill of Materials" link
    And I enter item number "SHN9663B"
    And I select region "Bom Source MotoPDM"
    And I press the "Search" button
    And I follow the "SHN9663B" link
    And I follow the "Flat BOM" link
   Then I should see part number "0387347Y01"

    

   
