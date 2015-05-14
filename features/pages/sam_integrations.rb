class SamIntegrations
include Capybara::DSL

def navLogin #user flyout or account management flyout
  #require 'debug'
  find('.site-nav-firefly-module.site-nav-item-visible').hover
  find('.site-nav-firefly-item.site-nav-module.site-nav-firefly-module.site-nav-item-visible span.site-nav-inner-wrap div.site-nav-dropdown.site-nav-firefly-dropdown div.site-nav-firefly-dropdown-section.ff-login a.ui-chunky-btn.secondary.ff.ff-login-btn.firefly-signin-btn.sam-returns').click
end

def loginPageLoaded
  find('main.login')
  #expect(page).to have_selector('main.login')
end

def logIn(auth_status="authorized",payment_status="no_expiration")
  if auth_status=="authorized"
      email = case payment_status
        when "no_expiration" then "DC8888800@mailinator.com" #Benjamin Franklin creditCardExpirationMonth: null, creditCardExpirationYear: null, lastPaymentFailed: false
        when "not_expired" then "DC8888801@mailinator.com" #George Washington creditCardExpirationMonth: "12", creditCardExpirationYear: "2020", lastPaymentFailed: false
        when "expired" then "DC8888802@mailinator.com" #John Adams creditCardExpirationMonth: "12", creditCardExpirationYear: "2015", lastPaymentFailed: false
        when "lastpaymentfailed" then "DC8888803@mailinator.com" #Thomas Jefferson creditCardExpirationMonth: "12", creditCardExpirationYear: "2020", lastPaymentFailed: true
        #else "DC8888800@mailinator.com"
        end
  else
      email = case payment_status #User has license for the Nashville but not Rochester
        when "no_expiration" then "TN8888800@mailinator.com" #Betsy Ross creditCardExpirationMonth: null, creditCardExpirationYear: null, lastPaymentFailed: false
        when "not_expired" then "TN8888801@mailinator.com"  #Martha Washington creditCardExpirationMonth: "12", creditCardExpirationYear: "2020", lastPaymentFailed: false
        when "expired" then "TN8888802@mailinator.com"  #Abigal Adams creditCardExpirationMonth: "12", creditCardExpirationYear: "2015", lastPaymentFailed: false
        when "lastpaymentfailed" then "TN8888803@mailinator.com" #Martha Jefferson creditCardExpirationMonth: "12", creditCardExpirationYear: "2020", lastPaymentFailed: true
        #else "TN8888800@mailinator.com"
        end
    end
  fill_in('username', :with => email)
  fill_in('password', :with => "New1111")
  find('main.login div.page form fieldset.bottomButtons button.primary.left.last').click
end

def logOut
  find('.site-nav-firefly-span').hover
  find('a.ff-logout-btn.sam-returns').click
end

end
