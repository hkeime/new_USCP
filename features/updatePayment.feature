@ignore @update_payment @acceptance
Feature: Update Payment Modal
Users with expired card or last payment failed get modal
User whose card is not expired and has not failed does not get modal
Button on modal to update payment opens the SAM payment information page
No thanks link closes modal


Background:
Given I have no browser cookies
When I am on the USCP article page
Then The article page loads
When  I click Log in in pushdown
Then the log in page loads

Scenario: Update Payment links to SAM page
  #Given I log in with "DC4834301@mailinator.com" and "New1111"
  Given I login with "authorized" account that is "expired"
  When Update Your Payment Information modal displays
  Then "update your payment information" link displays
  When I click "update your payment link"
  Then Update Your Payment Information modal does not display
  And A new window for the SAM Change Your Payment page opens
  When I am on the USCP article page
  Then I log out
  When I click Log in in pushdown
  Then the log in page loads
  When I log in with "DC4834301@mailinator.com" and "New1111"
  Then Update Your Payment Information modal does not display
