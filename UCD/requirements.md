### FR-00: Create a Game

Type: Functional

Priority: Must Have

Description: The system SHALL allow user to create games

Test:
- user becomes host
- user can set the court
- user set the time and date
- user can set the number of players (1v1, 2v2, 3v3, 4v4, 5v5)
- user can set game visibility (public or private)
- user can set if is ranked or not (winners get points to climb a ranking table)
- user can select to randomize teams or not (players can join directly a team or just join the game and teams will be random)
- user can set target points (11 to 21)
- user can add friends and team members

User Story: As Miguel, I want to create a 4v4 game in Monte do Penedo for Saturday at 3p.m., 
public and ranked, with my 2 friends in my team, and counting ot the ranking.

Data: Game -> Date, time, location, max players, Players, visibility, isRanked, isRandomTeam, target points

Questions:

- How much time in advance can a game be created?

### FR-01: Send Game Notification

Type: Functional

Priority: Should Have

Description: The system SHALL send notification to players who opted in to receive new games updates

Test:
- sends notification to players that opted in to receive notification of that court

User Story: As Miguel I want to receive notifications when a game is created in my favourite courts

### FR-02: Send Game Invites

Type: Functional

Priority: Must Have

Description: The system SHALL send notification to the players that the host invited to the game

Test:
- notifications are sent to the invited players 

User Story: As Miguel I want to send invitations and notify friends and teammates to join the game I created.

### FR-03: Accept or Reject Invitation

Type: Functional

Priority: Must Have

Description: The system SHALL allow users to accept or reject game invitations 

User Story: As Miguel, I want to accept or reject friends invitations to games

### FR-04: Browse Games

Type: Functional

Priority: Must Have

Description: The system SHALL allow users to browse through games in different courts with filters

User Story: As Miguel, I want to search for games in specific courts, filtering through the games parameters.

Test:

- user can filter date
- user can filter location
- user can filter if it is a ranked match,
- user can filter the number of players

### FR-05: Request to join a game

Type: Functional

Priority: Must Have

Description: The system SHALL allow users to request to join the game

User Story: As Miguel, I want to request to join a game

Test:

- user can request to join
- a notification is sent to the host

### FR-06: Accept or Reject players into the game

Type: Functional

Priority: Must Have

Description: The system SHALL allow the host of the game to accept or reject players that want to join

User Story: As Miguel and host of a game, I want to be able to accept or reject players into my game

Test:

- host receive notification of request
- host can accept a new player
- host can reject a new player
- a player is added to the game, if accepted

### FR-07: Users or Teams can challenge other users or teams

Type: Functional

Priority: Should Have

Description: The system SHALL allow users and teams to challenge other users and teams

User Story: As Miguel I want to challenge a team to play against mine.

Test:

- user can challenge team by suggesting the parameters of the game
- both team receives an invitation, with a notification

### FR-08: Start a game

Type: Functional

Priority: Must Have

Description: The system SHALL allow the host to start the game

User Story: As Miguel and host of the game, I want to start a game.

Test:
- host can start a game
- players are checked in to the court

### FR-09: Finish the game

Type: Functional

Priority: Must Have

Description: The system SHALL allow users to finish the game by having one player of each team inserting the result

User Story: As Miguel I want to be able to finish the game and add the result and the winning team

Test:
- the user ends the game
- the user adds the result
- a winner is set

### FR-10: Spectator

Type: Functional

Priority: Can Have

Description: The system SHALL allow users to inform they are watching the game and also add the final result

User Story: As Miguel I want to be able to watch the game and set the final result

### FR-11: Ranking players

Type: Functional

Priority: Must Have

Description: The system SHALL attribute points to the winning team and update the ranking table.

User Story: As Miguel I want to receive points for each victory and compete in a ranking table.

Test:

- all user from the winning team receives points
- ranking table points and positions are updated

### FR-12: See players profile

Type: Functional

Priority: Must Have

Description: The system SHALL allow users to see user profiles, including ranking, history

User Story: As Miguel I want to be able to see who am I playing against, the level he is and the history of games

Test:
- user can access a profile page of other users

### FR-13: Create teams

Type: Functional

Priority: Should Have

Description: The system SHALL allow users to invite players to teams and compete in a ranking table

User Story: As Miguel I want to be able to invite players to my team and when entering games, going with that team,
and compete in a teams ranking table

Test:
- users can invite players to a team
- users are added to a team
- teams are ranked

### FR-14: Classify players

Type: Functional

Priority: Can Have

Description: The system SHALL allow users to classify other users that they play against

User Story: As Miguel I want to be able to classify and see the classification of other players

### FR-15: Tournament 

Type: Functional

Priority: Can Have

Description: The system SHALL allow users to create tournaments with multiple teams 

User Story: As Miguel, I want to be able to create a tournament with multiple team

Test:

- create multiple games with the parameters
- user can choose number of teams
- user can choose the format of the game

### FR-16: Spontaneous Game  

Type: Functional

Priority: Should Have

Description: The system SHALL allow users to create quick spontaneous games to play an instant match

User Story: As Carlos, I want to be able to create quick games while I am in the court

Test:

- user can create a game with fewer parameters (no time, location or date as it is going to start instant)
- user can add in the end of the game the other players can join 
- it works as a normal game

### FR-17: Check in/out   

Type: Functional

Priority: Must Have

Description: The system SHALL allow users to check in and out of a court

User Story: As Carlos I want to be able to check in to a court so other players can see I am in

Test:
- user can check in and out of the court

### FR-18: Court availability   

Type: Functional

Priority: Must Have

Description: The system SHALL count the number of checked in players and display the number so other players see how crowded it is

User Story: As Carlos, I want to know how crowded are the courts to choose the right one

Test:
- user can see the number of users in each court

### FR-19: Add courts 

Type: Functional

Priority: Should Have

Description: The system SHALL allow users to add courts in a map  

User Story: As Carlos, I want to add a court that is not already the system

Test:
- user can add a new court
- user can set the number of hops
- user can set the conditions of the court
- user add pictures
- user can add the court into the map

### FR-20: Add court review

Type: Functional

Priority: Shall Have

Description: The system SHALL allow users to give reviews of the court

User Story: As Carlos, I want to be able to review the court so other people are aware and maybe responsible people can improve

Test:
- user can write a review
- user can add a classification

### FR-21: Intention on going   

Type: Functional

Priority: Should Have

Description: The system SHALL allow users to tell when they intend on going to a specific court

User Story: As Carlos, I want to say when I intend on going 

Test:
- user can set a time, place and date

### FR-22: Check probably court availability 

Type: Functional

Priority: Should Have

Description: The system SHALL allow users to see how many users intend on going in on a specific time and place

User Story: As Carlos, I want ot be able to see how many players intend on going at a specific time and place

Test:
- user can see in the court how many players will be there in a specific time and date