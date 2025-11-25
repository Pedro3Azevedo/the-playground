# JIRA DEPENDENCIES - COPY-PASTE INTO EACH STORY DESCRIPTION

Instructions:
1. Find your story below (FR-00 through FR-31)
2. Copy the dependency text
3. Open that story in Jira
4. Edit the description
5. Paste the dependency text at the bottom
6. Save

---

## FR-00: Create a Game

**Dependencies (Must be completed first):**
- FR-27: User Authentication
- FR-28: Profile Management
- FR-30: View Court Details and Add to Favorites

---

## FR-01: Respond to game invitation

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-27: User Authentication
- FR-29: Notification Preferences

---

## FR-02: Receive Game Notifications

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-27: User Authentication
- FR-28: Profile Management
- FR-29: Notification Preferences
- FR-30: View Court Details and Add to Favorites

---

## FR-03: Browse and search games

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-27: User Authentication

---

## FR-04: Request to Join Game

**Dependencies (Must be completed first):**
- FR-03: Browse and search games
- FR-27: User Authentication
- FR-31: View Game Details

---

## FR-05: Manage Join Requests and Players

**Dependencies (Must be completed first):**
- FR-04: Request to Join Game

---

## FR-06: Challenge Teams

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-12: Team Management
- FR-27: User Authentication

---

## FR-07: Start Game

**Dependencies (Must be completed first):**
- FR-05: Manage Join Requests and Players
- FR-16: Court Check-In
- FR-27: User Authentication
- FR-31: View Game Details

---

## FR-08: End Game

**Dependencies (Must be completed first):**
- FR-07: Start Game

---

## FR-09: Spectator Mode

**Dependencies (Must be completed first):**
- FR-07: Start Game
- FR-27: User Authentication

---

## FR-10: Player Ranking System

**Dependencies (Must be completed first):**
- FR-08: End Game
- FR-27: User Authentication

---

## FR-11: View Player Profiles

**Dependencies (Must be completed first):**
- FR-27: User Authentication

---

## FR-12: Team Management

**Dependencies (Must be completed first):**
- FR-23: Respond to Friend Requests
- FR-27: User Authentication

---

## FR-13: Rate Players

**Dependencies (Must be completed first):**
- FR-08: End Game
- FR-11: View Player Profiles
- FR-27: User Authentication

---

## FR-14: Tournament Creation

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-12: Team Management
- FR-27: User Authentication

---

## FR-15: Spontaneous Game Creation

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-16: Court Check-In
- FR-27: User Authentication

---

## FR-16: Court Check-In

**Dependencies (Must be completed first):**
- FR-27: User Authentication
- FR-30: View Court Details and Add to Favorites

---

## FR-17: Court Occupancy Display

**Dependencies (Must be completed first):**
- FR-16: Court Check-In

---

## FR-18: Add New Courts

**Dependencies (Must be completed first):**
- FR-27: User Authentication

---

## FR-19: Rate and Review Courts

**Dependencies (Must be completed first):**
- FR-16: Court Check-In
- FR-27: User Authentication
- FR-30: View Court Details and Add to Favorites

---

## FR-20: Announce Playing Intentions

**Dependencies (Must be completed first):**
- FR-27: User Authentication
- FR-30: View Court Details and Add to Favorites

---

## FR-21: View Expected Court Availability

**Dependencies (Must be completed first):**
- FR-17: Court Occupancy Display
- FR-20: Announce Playing Intentions

---

## FR-22: Send Friend Requests

**Dependencies (Must be completed first):**
- FR-11: View Player Profiles
- FR-27: User Authentication

---

## FR-23: Respond to Friend Requests

**Dependencies (Must be completed first):**
- FR-22: Send Friend Requests

---

## FR-24: Game Chat

**Dependencies (Must be completed first):**
- FR-23: Respond to Friend Requests
- FR-27: User Authentication
- FR-31: View Game Details

---

## FR-25: View Game History

**Dependencies (Must be completed first):**
- FR-08: End Game
- FR-27: User Authentication

---

## FR-26: Search Players and Teams

**Dependencies (Must be completed first):**
- FR-11: View Player Profiles
- FR-27: User Authentication

---

## FR-27: User Authentication

**Dependencies:** None - START HERE FIRST! ✅

---

## FR-28: Profile Management

**Dependencies (Must be completed first):**
- FR-27: User Authentication

---

## FR-29: Notification Preferences

**Dependencies (Must be completed first):**
- FR-27: User Authentication
- FR-28: Profile Management

---

## FR-30: View Court Details and Add to Favorites

**Dependencies (Must be completed first):**
- FR-27: User Authentication
- FR-28: Profile Management

---

## FR-31: View Game Details

**Dependencies (Must be completed first):**
- FR-00: Create a Game
- FR-03: Browse and search games

---

# BUILD ORDER QUICK REFERENCE

## Phase 1 - Foundation (Do First):
1. FR-27: User Authentication
2. FR-28: Profile Management
3. FR-30: View Court Details and Add to Favorites
4. FR-29: Notification Preferences

## Phase 2 - Core Game Features:
5. FR-00: Create a Game
6. FR-03: Browse and search games
7. FR-31: View Game Details
8. FR-04: Request to Join Game
9. FR-05: Manage Join Requests and Players

## Phase 3 - Court Features:
10. FR-16: Court Check-In
11. FR-17: Court Occupancy Display
12. FR-20: Announce Playing Intentions
13. FR-21: View Expected Court Availability

## Phase 4 - Game Actions:
14. FR-07: Start Game
15. FR-08: End Game

## Phase 5 - Everything Else:
Build remaining stories based on dependencies shown above.

---

# STORIES WITH MOST BLOCKING POWER (Finish Early!)

🚨 FR-27: Blocks 25 stories - DO FIRST!
🚧 FR-28: Blocks 6 stories
🚧 FR-30: Blocks 5 stories
🚧 FR-00: Blocks 6 stories
🚧 FR-08: Blocks 3 stories
🚧 FR-16: Blocks 4 stories

---

END OF DEPENDENCY LIST
