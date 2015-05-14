sam= SamIntegrations.new

Given(/^I have no browser cookies$/) do
browser = Capybara.current_session.driver.browser
browser.manage.delete_all_cookies
end

When(/^I am on the USCP article page$/) do #use article page to log in to avoid high impact ads
  #visit 'http://easybtn-stage.democratandchronicle.com/'
  visit 'http://ux-preprod-app.democratandchronicle.com/story/news/health/blogs/all-about-health/2014/11/19/would-it-kill-anyone-to-reduce-hospital-readmissions/2513067/'
  #visit 'http://ux-preprod-app.democratandchronicle.com
  #visit ui_url('/')
  # http://www.usatoday.com/?no_ads=1" to avoid ads on page
end

Then (/^The article page loads$/) do
  expect(page).to have_selector('#overlay div.transition-wrap article.asset')
  #expect(page).to have_selector('.site-footer-logo')
end

When(/^I click Log in in pushdown$/) do
  sam.navLogin
  #find('.site-nav-firefly-module.site-nav-item-visible').hover
  #find('.site-nav-firefly-item.site-nav-module.site-nav-firefly-module.site-nav-item-visible span.site-nav-inner-wrap div.site-nav-dropdown.site-nav-firefly-dropdown div.site-nav-firefly-dropdown-section.ff-login a.ui-chunky-btn.secondary.ff.ff-login-btn.firefly-signin-btn.sam-returns').click
end

Then(/^the log in page loads$/) do
  #require 'debug'
  #expect(page).to have_selector('main.login')
  sam.loginPageLoaded
end


Given(/^I login with "(.*?)" account that is "(.*?)"$/) do |auth_status, payment_status|
  sam.logIn(auth_status,payment_status)
end

When(/^Update Your Payment Information modal displays$/) do
    expect(page).to have_css('div.expired-card-modal-wrapper')
end



Then(/^"(.*?)" link displays$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^Update Your Payment Information modal does not display$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^A new window for the SAM Change Your Payment page opens$/) do
  pending # express the regexp above with the code you wish you had
end
