require_relative '../../../../common/cucumber/bddfire_steps'

Given(/^I am on the home page of the heroes application$/) do
    visit("http://localhost:4200/dashboard")
end
