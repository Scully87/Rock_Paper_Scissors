Feature: Single Player Mode
	In order to play Rock Paper Scissors Single Player
	As a player
	I need to get play vs the computer

Scenario: A player can register
	Given I want to play single player
	And I registered to play
	Then I should be ready to play

Scenario: A player is playing
 	Given I've registered to play
 	When I choose Spock
 	Then I should see the outcome