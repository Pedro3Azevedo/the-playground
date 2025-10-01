# Problem Definition and Scope

## Context

Portugal is cleary not known for its basketball, the quality is far behind other european countries.
In the International Basketball Federation (FIBA) world ranking [reference](https://www.fiba.basketball/en/ranking/men), Portugal is in the 47 place, and in the middle of the European table in 25th place.
Comparing with our neighbours Spain that is in 7th in the world ranking. However, in the past years, the portuguese basketball achieve some marks.

First, Portugal had its first player in one of the best women league in the world, "Ticha" Penicheiro played during 15 seasons in the WNBA in th USA, winning a title with the Sacramento Monarchs, and some individual awards. And in 2019, entered the Women’s Basketball Hall of Fame, that has the goad of honouring the most influential players in women basketball. [referencia](https://www.fpb.pt/noticia/ticha-penicheiro-no-womens-basketball-hall-of-fame-2/)

After her, Neemias Queta was drafted to the NBA in 2021, being the first portuguese in the NBA, and in the 2023-24 season won his first title with the Boston Celtics.
Besides not being the most valuable player in his team in the USA, he played an important role with the National team in second appearance in the EuroBasket tournament in 2025.
In this campaign, the portuguese team made a surprise performance, passing through the group phase and then, confronting the German team. In this game the portuguese team was holding up until the last quarter, where the world champions and the winners of the EuroBasket 2025 took the victory.
After the first victory in the EuroBasket, Neemias mentioned that it was a great moment fot the sport in Portugal and wants the sport to grow more in Portugal. [referencia](https://maisfutebol.iol.pt/basquetebol/selecao/e-um-bom-momento-para-o-basquetebol-em-portugal-queremos-mais-espaco)

To help with this goal, a survey was made in order to understand how players and basketball enthusiasts use the public basketball courts, the frequency, and the problems.

## Problem

After a some conversations with few basketball players and leaning heavily in a survey responses, basketball players and enthusiasts wish to go more often to public courts.
Besides time constraints, this two scenarios and the following complains are in these players mind:

Key Scenarios
- Insufficient players - People arrive to play but cannot form a team because not enough players are present;
- Overcrowding - Courts are full, forcing players to wait or leave.

Common annoyances reported
- Poor or unpredictable court conditions;
- Courts that are either empty or overcrowded;
- Social problems between players, including aggressive or unpleasant behaviour, individualistic style, and mismatched competitiveness (players who do not take the game seriously or whose skill and attitude creates a poor experience).

So, there is a coordination and information problem. Basketball players lack a platform to discover, schedule and evaluate informal games, and to verify court availability and condition.
This leads to inefficient use of time, by going to a court with unsatisfiable condition to the player, decrease participation, and lower quality social and sporting experience.

## Proposed solution

Design and implement a digital platform that addresses the coordination and information gaps in amateur basketball in public courts, by focusing on two primary features:

1. Pickup games* - Create, discover and join informal matches (pickup games), with features that support different play modes and social organization:
   - Players can create, search for and join games listed on the platform;
   - The games can be competitive or casual;
   - Competitive games contribute to a leaderboard/raking table per court;
   - Game formats include 1v1, 3v3, 4v4, 5v5;
   - Users can create and mange persistent teams and challenge other teams.
   - Users can set a team as "next"** to a game, to play against the winner. 
2. Court Availability and condition awareness - Give users real-time and information about courts so they can decide where and when to go
   - Persistent court catalogue with attributes - name, location, full/half court, number of courts, has water fountain, etc.
   - Users can indicate intent to attend a court at a specific time, so others can have an idea of the availability.
   - User can mark themselves "present" at a court.
   - Optional automatic geolocation-based check-in to simplify presence signalling.
   - Live occupancy indicators to show how many users intend to go and how many are currently present.
   - Court condition reporting by the users, they can submit short status updates to report issues.
   - Display short weather summary for the court location (optional)

*pickup games is the name used by basketball players to call a game without a formal organization (not in a league, no referee, no strick rules) [reference](https://www.basketballforcoaches.com/pickup-basketball/)
**"next" is used in the casual pickup games to tell the current teams playing, that wants to play against the winning team.
