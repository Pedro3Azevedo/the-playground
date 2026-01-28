# The Playground: 
## mobile platform to connect amateur basketball players

## Overview

This repository contains the dissertation materials, documentation, and non-code artifacts for *The Playground*, a mobile platform designed to connect amateur basketball players in Portugal for organizing casual games. The project combines user-centered design (UCD) principles with Agile/Scrum methodologies across three iterative development phases.
The application is a Kotlin Multiplatform with Compose Multiplatform for the UI, with Acceptance Test-Driven Development, and a MVVM pattern, along side Supabase as a MBaaS.

**Note:** Source code is not publicly shared in this repository. This repository contains dissertation documentation, user research materials, design artifacts, and other documents to support the dissertation.

**Dissertation Proposal Document** - [dissertationProposalPedroAzevedo2026.pdf](dissertationProposalPedroAzevedo2026.pdf)

## Dissertation Details

- **Author:** Pedro Azevedo
- **University:** University of Aveiro, DETI
- **Submission Date:** June 5, 2026
- **Supervisor(s):** Doutor Ilídio Oliveira
- **Program:** Master's in Informatics Engineering


## Problem Statement
Casual basketball players at Lisbon's public courts face a critical coordination challenge: temporal misalignment. Players lack visibility into when and where other players will be present, resulting in two inefficient scenarios: courts sitting empty while players want to play, or courts becoming overcrowded with long wait times.

### Key Problems Identified
**Primary Challenge: Coordination & Information Gap**

- Players cannot reliably signal their intentions or observe court occupancy in advance
- No shared communication mechanism exists for organizing games
- Court usage fluctuates throughout the day and week based on unpredictable individual decisions
- Players lack information about who is planning to visit which court and when

**Secondary Challenges**

- Poor court conditions and lack of maintenance visibility
- Social friction between players (aggressive behavior, mismatched competitive levels, individualistic attitudes)
- Low motivation to return to courts due to negative experiences

### Research Validation

A survey with casual basketball players (n=50) at public courts revealed that the primary barriers to frequent play are:

- Uncertainty about player availability (not knowing if enough players will be present)
- Overcrowding (too many players competing for limited court space)
- Lack of coordination mechanisms to align player schedules and preferences

### Impact
This temporal misalignment creates a collective action problem: individual decisions made in isolation result in inefficient court utilization, missed opportunities for games, and reduced motivation for players to engage with public courts. While digital platforms have transformed individual fitness tracking (running, cycling), team sports coordination remains stuck in an analog era of chance encounters and informal word-of-mouth communication.

## Proposed Solution

The proposed solution is to develop a digital platform where amateur basketball players can organise casual games in advance and check court availability to plan when and where to play.

The proposed solution will focus on two primary features:
**Informal Games “Pickup games”** - Enable players to create, discover and join informal matches (pickup games), with features that support different play modes and social organization:
• Players can create, search for and join games listed on the platform;
• The games can be competitive or casual;
• Competitive games contribute to a leaderboard/raking table per court;
• Game formats include 1v1, 3v3, 4v4, 5v5;
• Users can create and mange persistent teams and challenge other teams;

**Court Availability and condition awareness** - Provide users with real-time and information about courts so they can decide where and when to play:
• Persistent court catalogue with attributes - name, location, full/half court, number of courts, has water fountain, etc;
• User can check-in to a court;
• Users can indicate intent to attend a court at a specific time, so others can have an idea of the availability;
• Live occupancy indicators to show how many users intend to go and how many are currently present;
• Court condition reporting by the users, they can submit short status updates to report issues.

### Methodology

The project adopts User-Centred Design (UCD), ensuring that users are involved throughout the design process integrated with Agile. The UCD is applied across three phases,
each culminating in direct user evaluation. This iterative phases are complemented by Scrum, in
the implementation phases, where it promotes adaptive planning and continuous improvement,
and Acceptance Test-Driven Development (ATDD), ensuring that the system’s features align
with user expectations and perform as intended.

### Architecture

The project follows a Clean Architecture with three layers, the UI Layer focuses on presentation concerns
while the business logic and data management are encapsulated in the Data Layer and, when present, domain layers, clearly separating responsibilities across the application. 
Besides that, the project will follow the Model-View-Model (MVVM) pattern, where there is a clear separation between the logic and the UI, enabling a better development, testing and a clean code base.[46]
The Figure 1 represents the project’s architecture and some technologies that will be used, decided after the gathering of requirements.
In the Presentation Layer there is the UI components, that will be developed using Compose Multiplatform, and the ViewModel, classes that hold states of the application and exposes them to the View. 
The ViewModel will call the Use Cases, in the Domain Layer which use entities and the repositories interfaces to connect with the data layer. 
Here will be use Kotlin Multiplatform taking advantage of the native capabilities while working in both Android and iOS.

![System Architecture](Architecture/architectureDiagram.png "System Architecture")

| Component             | Technology            | Rationale                                         |
|-----------------------|-----------------------|---------------------------------------------------|
| Mobile Framework      | Kotlin Multiplatform  | Code reusability, type safety                     |
| UI Framework          | Compose Multiplatform | Modern declarative UI, consistency                |
| MBackend-as-a-Service | Supabase              | Real-time databases, authentication, scalability  |
| Local Database        | Room                  | Offline-first architecture, data persistence      |
| Maps                  | MapLibre              | Open-source, privacy-respecting location services |
| Push Notifications    | OneSignal             | Reliable engagement, multi-platform support       |
