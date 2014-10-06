Given(/^I want to play single player$/) do
  visit '/'
  click_on 'Single'
end

Given(/^I registered to play$/) do
  fill_in 'name', with: "Scully"
  click_on 'Play!'
end

Then(/^I should be ready to play$/) do
   expect(page).to have_content "Let's do this You are versing Computer" 
end

Given(/^I've registered to play$/) do
  visit '/'
  click_on 'Single'
  fill_in 'name', with: "Scully"
  click_on 'Play!'
end

When(/^I choose Spock$/) do
  click_on 'Spock'
end

Then(/^I should see the outcome$/) do
  expect(page).to have_content 'results'
end