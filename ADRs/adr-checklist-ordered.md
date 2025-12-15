# ADR Implementation Checklist - Ordered for Development (Supabase Stack)

## Purpose
This checklist shows the **order** in which to make and document architectural decisions. Each decision enables the next ones, so they build on each other logically.

---

adrs/
├── ADR-001-frontend-architecture.md
├── ADR-002-ui-framework.md
├── ADR-003-alt-mbaas-backend.md
├── ADR-004-alt-realtime-communication.md
├── ADR-005-offline-first-sync.md
├── ADR-006-conflict-resolution.md
├── ADR-007-alt-database-schema.md
├── ADR-010-notifications.md
├── ADR-011-geolocation-mapping.md
├── ADR-012-security-encryption.md
└── ADR-020-row-level-security.md

---

## PHASE 0: FOUNDATION (Week 1) - Must Do First

These decisions are **foundational**. Everything else depends on them.

### ✅ TIER 1: Absolutely Critical (Do These First)

- [ ] **ADR-001: Frontend Architecture Pattern**
  - **Why First:** Determines how your entire app is structured
  - **Impacts:** All other frontend decisions
  - **Dependencies:** None
  - **Output:** App structure, code organization, testing strategy
  - **Time:** 1-2 hours to write
  - **Related User Stories:** All FRs

- [ ] **ADR-002: UI Framework Selection**
  - **Why Second:** Chosen because of ADR-001
  - **Impacts:** How you build UI, testing, cross-platform code
  - **Dependencies:** ADR-001
  - **Output:** Technology choice (Kotlin Multiplatform + Compose)
  - **Time:** 1-2 hours to write
  - **Related User Stories:** All UI-related FRs

- [ ] **ADR-003-ALT: MBaaS Backend (Supabase vs Alternatives)**
  - **Why Third:** Foundational for entire backend strategy
  - **Impacts:** All backend, database, auth, realtime decisions
  - **Dependencies:** ADR-001, ADR-002 (to understand constraints)
  - **Output:** Backend platform choice
  - **Time:** 2-3 hours to write
  - **Related User Stories:** All backend-dependent FRs

---

## PHASE 1: DATA & SYNC ARCHITECTURE (Week 1-2)

These decisions shape how data flows through your system.

### ✅ TIER 2A: Data Strategy

- [ ] **ADR-007-ALT: Database Schema & Modeling (Supabase PostgreSQL)**
  - **Why Here:** Needs ADR-003 decided first (Supabase chosen)
  - **Impacts:** How you design tables, RLS policies, queries
  - **Dependencies:** ADR-003-ALT (MBaaS choice)
  - **Output:** Database schema design, PostGIS usage, table relationships
  - **Time:** 2-3 hours to write
  - **Related User Stories:** FR-00 through FR-32 (all feature-related)
  - **Action Items:**
    - [ ] Design game, player, team, court tables
    - [ ] Plan geospatial columns (court location, check-in coords)
    - [ ] Plan chat table structure
    - [ ] Design check-in and ranking tables

- [ ] **ADR-005: Offline-First Sync (SQLite + Sync Engine)**
  - **Why Here:** Needs database schema known (ADR-007) to plan sync
  - **Impacts:** How client caches data, sync logic, conflict handling
  - **Dependencies:** ADR-003-ALT, ADR-007-ALT
  - **Output:** Offline sync architecture, SQLDelight usage, sync algorithm
  - **Time:** 2-3 hours to write
  - **Related User Stories:** FR-10 (create game offline), FR-12 (respond to invitations offline), all offline features
  - **Action Items:**
    - [ ] Define which tables sync offline
    - [ ] Design sync frequency and triggers
    - [ ] Plan dirty record tracking
    - [ ] Design sync metadata schema

- [ ] **ADR-006: Conflict Resolution Strategy**
  - **Why Here:** Depends on ADR-005 (sync) being designed
  - **Impacts:** How concurrent edits are handled, merge logic
  - **Dependencies:** ADR-005 (offline sync)
  - **Output:** Conflict resolution rules, merge strategies, business logic
  - **Time:** 1-2 hours to write
  - **Related User Stories:** FR-10 (game creation), FR-12 (join game), team formation
  - **Action Items:**
    - [ ] Define LWW (last-write-wins) default
    - [ ] Define domain-specific rules (e.g., score confirmations)
    - [ ] Plan 3-way merge for concurrent edits
    - [ ] Document impossible conflict scenarios

---

## PHASE 2: REAL-TIME & COMMUNICATION (Week 2)

These decisions shape how data flows in real-time.

### ✅ TIER 2B: Real-Time Strategy

- [ ] **ADR-004-ALT: Real-Time Communication (Supabase Realtime Channels)**
  - **Why Here:** Needs database schema (ADR-007) and backend choice (ADR-003)
  - **Impacts:** How live updates work, WebSocket usage, subscription model
  - **Dependencies:** ADR-003-ALT, ADR-007-ALT
  - **Output:** Realtime channel naming, subscription strategy
  - **Time:** 1-2 hours to write
  - **Related User Stories:** FR-11 (receive notifications), FR-24 (chat), FR-26 (see check-ins), FR-30 (watch occupancy)
  - **Action Items:**
    - [ ] Plan channel naming (e.g., `games:{courtId}`, `chat:{gameId}`)
    - [ ] Define message types (new game, join request, check-in, message)
    - [ ] Design broadcast strategy
    - [ ] Plan offline queueing for messages

- [ ] **ADR-020: Row Level Security (RLS) Policies**
  - **Why Here:** Depends on database schema (ADR-007) and Supabase choice (ADR-003)
  - **Impacts:** Data access control, privacy, security at DB level
  - **Dependencies:** ADR-007-ALT, ADR-003-ALT
  - **Output:** RLS policies for games, players, messages, check-ins
  - **Time:** 2-3 hours to write
  - **Related User Stories:** All FRs (security affects all data access)
  - **Action Items:**
    - [ ] Design RLS for games table (users see only relevant games)
    - [ ] Design RLS for chat (users see only game they're in)
    - [ ] Design RLS for check-ins (users see only their own data)
    - [ ] Design RLS for rankings (public reads, admin writes)

---

## PHASE 3: AUTHENTICATION & INTEGRATION (Week 2-3)

These decisions shape security and external integrations.

### ✅ TIER 3A: Security & Authentication

- [ ] **ADR-012: Security & Encryption (TLS 1.3 + AES-256 E2E Chat)**
  - **Why Here:** Foundational security, impacts all communication
  - **Impacts:** Encryption strategy, key management, compliance
  - **Dependencies:** ADR-003-ALT (backend choice), ADR-004-ALT (realtime choice)
  - **Output:** Encryption implementation, key rotation, GDPR strategy
  - **Time:** 2-3 hours to write
  - **Related User Stories:** FR-24 (chat), all FRs (security crosses all)
  - **Related NFRs:** NFR-05 (GDPR), NFR-06 (TLS), NFR-21 (E2E encryption)
  - **Action Items:**
    - [ ] Plan AES-256 implementation for chat
    - [ ] Define key exchange protocol
    - [ ] Plan E2E key rotation
    - [ ] Document GDPR compliance approach

- [ ] **ADR-010: Notifications (FCM + APNS + Supabase Webhooks)**
  - **Why Here:** Depends on backend/realtime strategy (ADR-003, ADR-004)
  - **Impacts:** How notifications are delivered, webhook strategy
  - **Dependencies:** ADR-003-ALT, ADR-004-ALT, ADR-007-ALT
  - **Output:** Notification architecture, webhook triggers, delivery guarantees
  - **Time:** 1-2 hours to write
  - **Related User Stories:** FR-11 (notifications), FR-01 (game invitations)
  - **Action Items:**
    - [ ] Plan FCM for Android, APNS for iOS
    - [ ] Design Supabase webhook triggers
    - [ ] Define notification types and delivery
    - [ ] Plan notification preferences storage

- [ ] **ADR-011: Geolocation & Mapping (Device GPS + Google Maps API)**
  - **Why Here:** Needed for court location features
  - **Impacts:** GPS collection, map display, location privacy
  - **Dependencies:** ADR-007-ALT (PostGIS geospatial), ADR-012 (privacy/security)
  - **Output:** GPS strategy, map integration, privacy controls
  - **Time:** 1-2 hours to write
  - **Related User Stories:** FR-16 (court check-in), FR-13 (browse games on map)
  - **Related NFRs:** NFR-13 (GPS), NFR-14 (maps), NFR-07 (location privacy)
  - **Action Items:**
    - [ ] Plan GPS accuracy and update frequency
    - [ ] Design map UI
    - [ ] Define location privacy controls
    - [ ] Plan court geocoding

---

## PHASE 4: OPTIONAL ENHANCEMENTS (Week 3-4)

These decisions improve performance, observability, or specific features.

### ⚠️ TIER 3B: Nice-to-Have (Can Be Done Later)

- [ ] **ADR-014: Caching Strategy (Do We Need Redis?)**
  - **Why Optional:** Supabase may be sufficient initially
  - **When Needed:** If performance issues emerge
  - **Impacts:** Performance optimization, cache invalidation
  - **Dependencies:** ADR-007-ALT (database)
  - **Output:** Decision on Redis usage or not
  - **Time:** 1 hour to write
  - **Related User Stories:** FR-13 (game list performance)

- [ ] **ADR-015: Edge Functions (Supabase or Separate?)**
  - **Why Optional:** May not need custom backend logic initially
  - **When Needed:** If business logic needs to live on server
  - **Impacts:** Where custom logic executes
  - **Dependencies:** ADR-003-ALT (MBaaS choice)
  - **Output:** Decision on Edge Functions vs custom webhooks
  - **Time:** 1 hour to write
  - **Related User Stories:** Complex workflows, batch operations

- [ ] **ADR-023: Sync Strategy (Optimistic vs Pessimistic)**
  - **Why Optional:** Can be refined after ADR-005
  - **When Needed:** Before finalizing sync algorithm
  - **Impacts:** Sync behavior, UI responsiveness
  - **Dependencies:** ADR-005 (offline sync)
  - **Output:** Detailed sync strategy
  - **Time:** 1 hour to write

- [ ] **ADR-025: Database Migrations (Schema Change Strategy)**
  - **Why Optional:** Needed when planning production deployments
  - **When Needed:** Before releasing to production
  - **Impacts:** How schema changes are deployed
  - **Dependencies:** ADR-007-ALT (database schema)
  - **Output:** Migration strategy, downtime prevention
  - **Time:** 1 hour to write

---

## PHASE 5: DOMAIN-SPECIFIC LOGIC (Week 4+)

These decisions are specific to basketball app features.

### 🎯 TIER 4: Basketball App Features

- [ ] **ADR-046: Ranking Algorithm**
  - **Why Here:** Feature-specific, non-blocking for other decisions
  - **Impacts:** Ranking calculation, update frequency, leaderboard
  - **Dependencies:** ADR-007-ALT (database)
  - **Output:** Ranking formula, update triggers
  - **Time:** 1-2 hours to write
  - **Related User Stories:** FR-29 (view rankings), FR-03 (ranking)

- [ ] **ADR-049: Chat Message Ordering**
  - **Why Here:** Feature-specific, depends on realtime strategy
  - **Impacts:** Message ordering, timestamp handling
  - **Dependencies:** ADR-004-ALT (realtime), ADR-005 (sync)
  - **Output:** Message ordering strategy
  - **Time:** 1 hour to write
  - **Related User Stories:** FR-24 (chat)

- [ ] **ADR-050: Game State Machine**
  - **Why Here:** Feature-specific, depends on schema
  - **Impacts:** Game lifecycle, state transitions
  - **Dependencies:** ADR-007-ALT (database), ADR-006 (conflict resolution)
  - **Output:** Game state machine, transition rules
  - **Time:** 1-2 hours to write
  - **Related User Stories:** FR-10 (create game), FR-01 (respond to invitation), FR-22 (finish game)

- [ ] **ADR-051: Team Formation Algorithm**
  - **Why Here:** Feature-specific, nice-to-have initially
  - **Impacts:** Auto-balancing teams, fairness
  - **Dependencies:** ADR-007-ALT (database)
  - **Output:** Team balancing algorithm
  - **Time:** 1 hour to write
  - **Related User Stories:** FR-10 (team formation)

---

## COMPLETE ORDERED CHECKLIST (Just the Essentials)

**Do these in order to build your architecture diagram and make development decisions:**

### Week 1 (Days 1-2): Foundation
1. [ ] **ADR-001:** Frontend Architecture (MVVM + Clean)
2. [ ] **ADR-002:** UI Framework (Kotlin Multiplatform)
3. [ ] **ADR-003-ALT:** MBaaS Backend (Supabase)

### Week 1-2 (Days 3-5): Data Layer
4. [ ] **ADR-007-ALT:** Database Schema & Modeling
5. [ ] **ADR-005:** Offline-First Sync
6. [ ] **ADR-006:** Conflict Resolution

### Week 2 (Days 6-8): Real-Time & Security
7. [ ] **ADR-004-ALT:** Real-Time Communication (Supabase Realtime)
8. [ ] **ADR-020:** Row Level Security Policies
9. [ ] **ADR-012:** Security & Encryption

### Week 2-3 (Days 9-11): Integration
10. [ ] **ADR-010:** Notifications
11. [ ] **ADR-011:** Geolocation & Mapping

### After MVP (Optional/Domain-Specific)
12. [ ] **ADR-014:** Caching Strategy
13. [ ] **ADR-015:** Edge Functions
14. [ ] **ADR-046:** Ranking Algorithm
15. [ ] **ADR-049:** Chat Message Ordering
16. [ ] **ADR-050:** Game State Machine
17. [ ] **ADR-051:** Team Formation Algorithm

---

## Architecture Diagram Dependencies

**This is the order components appear in your diagram:**

1. **Start with ADR-001 & ADR-002** → Draw frontend box (Kotlin Multiplatform + MVVM)
2. **Add ADR-003-ALT** → Draw Supabase box
3. **Add ADR-007-ALT** → Draw database schema inside Supabase
4. **Add ADR-004-ALT** → Draw realtime channels connection
5. **Add ADR-020** → Add RLS policies annotation
6. **Add ADR-005** → Draw SQLite box on client, sync arrow
7. **Add ADR-012** → Add encryption annotations (TLS, E2E)
8. **Add ADR-010** → Draw FCM/APNS box
9. **Add ADR-011** → Draw GPS and Google Maps boxes

**Final diagram structure:**
```
┌────────────────────────────────┐
│ Mobile App (ADR-001, ADR-002)  │
│ ┌──────────────────────────────┤
│ │ SQLite (ADR-005)             │
│ │ Sync Engine (ADR-005/006)    │
│ └──────────────────────────────┤
└──────────┬──────────────────────┘
           │ TLS 1.3 (ADR-012)
           │
┌──────────▼──────────────────────┐
│ Supabase (ADR-003-ALT)           │
│ ┌──────────────────────────────┤
│ │ PostgreSQL + PostGIS (ADR-007)
│ │ Auth (Included)              │
│ │ Realtime Channels (ADR-004)  │
│ │ RLS Policies (ADR-020)       │
│ │ Storage                      │
│ └──────────────────────────────┤
└──────────┬──────────────────────┘
      ┌────┴──────┬─────────┐
      ▼           ▼         ▼
   FCM/APNS   GPS API   Google Maps
   (ADR-010)  (ADR-011)  (ADR-011)
```

---

## How to Use This Checklist

### Daily Workflow
1. **Pick one ADR from the current phase**
2. **Read the full ADR template from `architecture-decisions.md`**
3. **Write the ADR (1-2 hours each)**
4. **Review with thesis advisor**
5. **Mark as complete**
6. **Move to next ADR**

### File Naming Convention
```
ADR-001-frontend-architecture.md
ADR-002-ui-framework.md
ADR-003-alt-mbaas-backend.md
ADR-004-alt-realtime-communication.md
ADR-005-offline-first-sync.md
ADR-006-conflict-resolution.md
ADR-007-alt-database-schema.md
ADR-010-notifications.md
ADR-011-geolocation-mapping.md
ADR-012-security-encryption.md
ADR-020-row-level-security.md
ADR-046-ranking-algorithm.md
ADR-049-chat-message-ordering.md
ADR-050-game-state-machine.md
ADR-051-team-formation-algorithm.md
```

### Timeline
- **Week 1:** ADRs 001-003 (Foundation)
- **Week 1-2:** ADRs 007, 005, 006 (Data)
- **Week 2:** ADRs 004, 020, 012 (Real-Time & Security)
- **Week 2-3:** ADRs 010, 011 (Integration)
- **Week 3-4+:** Optional/Domain-specific ADRs

---

## Deliverables for Architecture Diagram

After completing the essential ADRs (1-11), you should be able to draw:

- ✅ **Mobile frontend architecture** (ADR-001, ADR-002)
- ✅ **Backend infrastructure** (ADR-003-ALT)
- ✅ **Database schema** (ADR-007-ALT)
- ✅ **Sync mechanism** (ADR-005, ADR-006)
- ✅ **Real-time strategy** (ADR-004-ALT)
- ✅ **Security layers** (ADR-012, ADR-020)
- ✅ **External integrations** (ADR-010, ADR-011)

This is a **complete, production-ready architecture** suitable for your thesis and product launch! 🎯

