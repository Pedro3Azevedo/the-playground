
## **ARCHITECTURE DESIGN CHECKLIST FOR YOUR KMP MOBILE APP**

### **1. PRESENTATION LAYER (UI/UX Architecture)**

#### 1.1 UI Framework \& State Management

- [ ] **Compose Multiplatform** setup confirmed (iOS + Android single codebase)
- [ ] **State Management Strategy**: Choose between:
    - [ ] Redux/Redux-Kotlin
    - [ ] MVI (Model-View-Intent)
    - [ ] MVVM with ViewModel
    - [ ] Composition with expect/actual for platform specifics
    - **Decision**: Document why (simplicity vs control)
- [ ] **Navigation architecture**: Jetpack Navigation equivalent for KMP or custom routing
- [ ] **Screen hierarchy \& composition strategy**: How screens share state
- [ ] **Offline UI indicators**: Visual feedback for offline state (timestamp, no-sync badge)
- [ ] **Error display strategy**: Toast, snackbar, inline errors per your NFR-09
- [ ] **Loading states**: Skeleton screens, progress indicators
- [ ] **Real-time updates strategy**: How games/occupancy updates reflect in UI without re-renders


#### 1.2 Platform-Specific Concerns

- [ ] **Expect/Actual pattern usage**: Where you'll diverge iOS/Android (permissions, sensors, native APIs)
- [ ] **Platform permissions handling**: GPS, camera, storage, notifications for both platforms
- [ ] **Native platform integration points**: Maps, camera, calendar, push notifications
- [ ] **Screen size adaptation**: Phone-only but varying sizes (tablets excluded)
- [ ] **Accessibility**: Dark/light mode support, text scaling, contrast ratios
- [ ] **Gesture handling**: Android back, iOS swipe back, bottom sheet interactions

***

### **2. DOMAIN LAYER (Business Logic)**

#### 2.1 Core Domain Models

- [ ] **User aggregate**: Auth state, profile, ranking, favorite courts, preferences
- [ ] **Game aggregate**: Creation, invitation, join requests, teams, scores, status lifecycle
- [ ] **Court aggregate**: Location, occupancy, ratings, check-ins, intentions
- [ ] **Team aggregate**: Members, ranking, challenge history
- [ ] **Notification aggregate**: Types, preferences, delivery status
- [ ] **Chat aggregate**: Messages, encryption, participants
- [ ] **Ranking system**: Point calculation, leaderboards per court/global


#### 2.2 Use Cases \& Interactors

- [ ] **Authentication**: Register, login, password reset, social login
- [ ] **Game management**: Create (offline possible), publish, invite, join, request, start, end, score entry
- [ ] **Offline game creation**: Create locally, persist, attempt sync when online, clear if app exits
- [ ] **Occupancy**: Check-in, check-out, visibility rules
- [ ] **Court**: Search, filter, add (offline), rate, favorite
- [ ] **Ranking**: Calculate points, update rankings, resolve conflicts
- [ ] **Notifications**: Send (in-app + push), mark read, preferences
- [ ] **Chat**: Send message, retrieve history, encryption/decryption, offline buffering
- [ ] **Conflict resolution**: Score disputes between teams (TODO in your notes)


#### 2.3 Validation \& Error Handling

- [ ] **Input validation**: Dates, scores, team sizes, player counts
- [ ] **Business rule validation**: Can't publish offline games, can't duplicate requests, ranked game rules
- [ ] **Error classification**: Network, validation, timeout, auth, unknown
- [ ] **Retry logic \& circuit breaker patterns**
- [ ] **Graceful degradation strategy** (NFR-03)

***

### **3. DATA LAYER (Local \& Remote Storage)**

#### 3.1 Local Database (Caching for Offline)

- [ ] **Database choice**: SQLite (via Room or KMP equivalent), Realm, or custom
- [ ] **Schema design for offline caching**:
    - [ ] Games (with sync status: draft, synced, pending)
    - [ ] Courts
    - [ ] Players/Profiles (limited by privacy)
    - [ ] Notifications
    - [ ] Chat messages (transient or persistent?)
- [ ] **Cache invalidation strategy**: TTL, manual refresh, sync triggers
- [ ] **Offline game drafts**: WHERE they're stored (not saved if app exits), how they're managed
- [ ] **Data consistency on schema changes**: Migrations, backward compatibility
- [ ] **Privacy in local storage**: Encryption at rest for sensitive data


#### 3.2 Remote Backend Integration

- [ ] **Backend service choice**: Firebase, Supabase, Parse, AWS Amplify, or custom REST/GraphQL
- [ ] **API design**:
    - [ ] REST or GraphQL?
    - [ ] Endpoint structure for games, courts, rankings, chat
    - [ ] Batch operations for efficiency
    - [ ] Pagination strategy for lists
- [ ] **Authentication \& Session Management**:
    - [ ] Token storage (encrypted)
    - [ ] Token refresh strategy
    - [ ] Logout \& session cleanup
- [ ] **Sync strategy**:
    - [ ] **Initial sync**: First app launch, all critical data
    - [ ] **Incremental sync**: Deltas since last sync (timestamp-based or version-based)
    - [ ] **Conflict resolution**: Last-write-wins, server-wins, or user intervention
    - [ ] **Sync on resume**: When app returns from background
    - [ ] **Bidirectional sync**: Changes on both sides handled
- [ ] **Network resilience**:
    - [ ] Retry logic with exponential backoff
    - [ ] Timeout thresholds
    - [ ] Queue for offline mutations (create game, join game, send chat)


#### 3.3 Real-Time Features

- [ ] **Real-time data updates choice**:
    - [ ] Polling (simple, inefficient)
    - [ ] WebSocket (Firebase Realtime DB, Supabase Realtime, custom)
    - [ ] Server-Sent Events (SSE)
    - [ ] Firebase Cloud Messaging (FCM) for critical updates
- [ ] **What needs real-time?**:
    - [ ] New games created nearby
    - [ ] Join requests accepted/rejected
    - [ ] Game status changes (started, ended)
    - [ ] Chat messages
    - [ ] Court occupancy counts
    - [ ] Notifications
- [ ] **Connection management**: Reconnection logic, backoff, state indicators
- [ ] **Battery/data optimization**: Reduce real-time for non-critical updates

***

### **4. COMMUNICATION LAYER (Network \& Notifications)**

#### 4.1 Push Notifications

- [ ] **Provider**: Firebase Cloud Messaging (FCM) for both Android \& iOS
- [ ] **Notification types to deliver**:
    - [ ] Game invitations
    - [ ] Join requests accepted/rejected
    - [ ] New games at favorite courts
    - [ ] Challenge received
    - [ ] Friend requests
    - [ ] Check-in notifications (friends)
- [ ] **Local notifications**: For reminders, offline events queued
- [ ] **Notification preferences**: User opt-in/opt-out per type (NFR-05, GDPR)
- [ ] **Deep linking**: Notification taps should navigate to relevant screen
- [ ] **Notification permissions**: iOS (prompt), Android 13+ (runtime)


#### 4.2 In-App Notifications

- [ ] **Design**: Where/how displayed (toast, banner, center, modal)
- [ ] **Queue**: Multiple simultaneous notifications management
- [ ] **Persistence**: Notification center, history


#### 4.3 Chat \& Messaging

- [ ] **End-to-End Encryption** (NFR-21, AES-256):
    - [ ] Encryption library choice: Tink, Conscrypt, or native platform libs
    - [ ] Key management: How keys are shared, rotated, stored
    - [ ] Message format: Plaintext + IV + ciphertext
- [ ] **Message delivery**:
    - [ ] Guaranteed delivery if offline: Queue locally, sync when online
    - [ ] Read receipts
    - [ ] Typing indicators (optional)
- [ ] **Chat scoping**: Only game participants can access chat (GDPR, privacy)
- [ ] **Chat retention**: Delete after game ends (per your AC)

***

### **5. LOCATION \& MAPS**

#### 5.1 GPS Integration

- [ ] **Permissions handling**: Location permission request flow
- [ ] **Continuous location tracking**:
    - [ ] Background location (if needed for check-in proximity)
    - [ ] Foreground location accuracy
    - [ ] Battery optimization: Accuracy levels, update frequency
    - [ ] Fallback: Manual court selection if GPS unavailable
- [ ] **Location privacy** (NFR-07):
    - [ ] User location NEVER shared with other users
    - [ ] Only court location shared publicly
    - [ ] Check-in proximity verification on backend
    - [ ] Spectator location validation (same court area)
    - [ ] How to prevent spoofing?


#### 5.2 Maps Integration

- [ ] **Maps provider**: Google Maps, Apple Maps (native), MapBox, or OpenStreetMap
- [ ] **Features**:
    - [ ] Display courts as markers
    - [ ] Occupancy indicators (color coding, counts)
    - [ ] User's location (blue dot, optional)
    - [ ] Draw radius for "nearby" games
    - [ ] Tap court → Details screen
- [ ] **List/Map toggle**: UX for switching views
- [ ] **Map clustering**: Performance for many courts
- [ ] **Search**: Autocomplete for court names/addresses

***

### **6. SECURITY \& PRIVACY**

#### 6.1 Authentication \& Authorization

- [ ] **Auth methods**:
    - [ ] Email/password with validation
    - [ ] Google OAuth
    - [ ] Facebook OAuth (decide if needed)
    - [ ] Apple Sign-In (iOS 13+)
- [ ] **Token management**:
    - [ ] Secure storage (Keychain/Keystore)
    - [ ] Refresh token rotation
    - [ ] Token expiration handling
    - [ ] Logout: Wipe tokens, clear user data
- [ ] **Rate limiting**: Failed login attempts (5 attempts, 15-min lockout per your AC)
- [ ] **Session timeout**: Inactivity logout strategy


#### 6.2 Data Security

- [ ] **TLS 1.3** (NFR-06): All API calls over HTTPS with TLS 1.3
- [ ] **Data at rest encryption**:
    - [ ] Local database encryption
    - [ ] Sensitive files encrypted
    - [ ] Keys stored securely (Keychain/Keystore)
- [ ] **Data in transit**: Message encryption (NFR-21)
- [ ] **Sensitive data in logs**: Scrub PII, auth tokens, locations


#### 6.3 Privacy (GDPR Compliance - NFR-05)

- [ ] **User consent**:
    - [ ] Privacy policy display on signup
    - [ ] Explicit consent for data collection (location, contacts, storage)
    - [ ] Consent withdrawal mechanism
- [ ] **Data minimization**: Collect only necessary data
- [ ] **User rights**:
    - [ ] Data export/download
    - [ ] Account deletion: Wipe all user data on backend + local
    - [ ] Right to be forgotten: Delete game history, ratings, etc.
- [ ] **Location data retention**: Only real-time search, not stored long-term (per your NFR)
- [ ] **Third-party APIs**: Document data sharing (Google, Facebook, Maps)
- [ ] **Children's privacy**: COPPA compliance if applicable


#### 6.4 Moderation \& Reporting (NFR-19)

- [ ] **Report flow**: Players, games, courts
- [ ] **Logging**: Who reported what, when (for analysis)
- [ ] **Admin review process**: Backend system for reviewing reports
- [ ] **Blocking users**: Mutual blocking logic

***

### **7. OFFLINE STRATEGY (Critical for Your App)**

#### 7.1 Offline Data Access

- [ ] **What's available offline**:
    - [ ] Cached games (last sync)
    - [ ] Cached courts
    - [ ] Cached user profiles
    - [ ] User profile (own)
    - [ ] Game history (cached)
- [ ] **Offline indicators**:
    - [ ] Persistent banner/badge showing offline status
    - [ ] Last sync timestamp displayed
- [ ] **Offline UI modifications**:
    - [ ] Disable actions requiring backend (publish game, accept request, etc.)
    - [ ] Show "Offline mode" labels


#### 7.2 Offline Game Creation (Your Specific Case)

- [ ] **Create but NOT publish**:
    - [ ] Store draft locally with status "draft"
    - [ ] Form validation allowed offline
    - [ ] Persist to local DB (auto-save every X seconds)
    - [ ] Clear if user exits app WITHOUT SAVING (per your requirement)
- [ ] **Publish on sync**:
    - [ ] When online, user taps "Publish" or "Save"
    - [ ] Draft sent to backend
    - [ ] Backend validation (scores, teams, courts exist)
    - [ ] Game ID returned, marked "synced"
    - [ ] If publish fails offline, requeue
- [ ] **Draft management**:
    - [ ] Show drafts in a separate section (Drafts tab?)
    - [ ] Resume draft functionality
    - [ ] Delete draft option
    - [ ] Auto-discard on app exit (define app exit: lifecycle events)


#### 7.3 Offline Limitations \& UX

- [ ] **Blocked actions messaging**: User sees "Not available offline" with explanation
- [ ] **Graceful degradation** (NFR-03):
    - [ ] Show cached data when available
    - [ ] Error messages user-friendly (no technical details)
    - [ ] Retry button for actions
- [ ] **Sync conflict strategy**: If draft outdated when bringing online

***

### **8. PERFORMANCE \& SCALABILITY**

#### 8.1 Response Times \& Load

- [ ] **Target response times**:
    - [ ] API calls: < 2-3s on 4G
    - [ ] UI response: < 100ms for interactions
    - [ ] List rendering: Smooth scrolling (60fps for KMP/Compose)
- [ ] **Pagination**:
    - [ ] Game lists: Load 20-50 at a time
    - [ ] Infinite scroll with load-more
    - [ ] Ranking tables: Top 100, paginated
    - [ ] Chat messages: Load last 50, paginate backwards
- [ ] **Search optimization**:
    - [ ] Local search (cached courts/players) vs server search
    - [ ] Debounce search input (300-500ms)
    - [ ] Limit results shown (top 20-30)
- [ ] **Image optimization**:
    - [ ] Court photos: Compress, resize for device
    - [ ] Profile photos: Thumbnails + full
    - [ ] Caching strategy (disk + memory)


#### 8.2 Resource Usage

- [ ] **Memory management**:
    - [ ] Image caching limits (max size)
    - [ ] ViewModel/State lifecycle properly managed
    - [ ] Weak references where appropriate
    - [ ] Coroutine cancellation on screen close
- [ ] **Battery**: GPS, real-time updates optimized
- [ ] **Data usage**: Compression, delta updates, offline-first
- [ ] **Storage**: Local DB size limits, cleanup old data


#### 8.3 Scalability

- [ ] **User growth**: Can backend handle 10k, 100k concurrent users?
    - [ ] Horizontal scaling strategy
    - [ ] Database scaling (sharding, replication)
    - [ ] CDN for static content (court photos)
- [ ] **Real-time scalability**: WebSocket connections, message queues
- [ ] **Caching strategy**: Redis for leaderboards, user sessions

***

### **9. TESTING STRATEGY (NFR-16)**

#### 9.1 Unit Tests

- [ ] **Domain layer**: All use cases, validators, calculations
- [ ] **Data layer**: Repository logic, caching, sync
- [ ] **Test coverage target**: Core business logic 80%+


#### 9.2 Integration Tests

- [ ] **API integration**: Mock backend, test sync scenarios
- [ ] **Database**: Cache, persistence, migrations
- [ ] **Offline scenarios**: Draft creation, sync conflicts


#### 9.3 UI/E2E Tests

- [ ] **Key user flows**: Create game, join game, check-in, chat
- [ ] **Offline flows**: Create draft offline, sync when online
- [ ] **Error flows**: Network errors, validation errors
- [ ] **ATDD methodology**: User stories → acceptance tests → implementation


#### 9.4 Manual Testing

- [ ] **Real device testing**: Both iOS \& Android
- [ ] **Network conditions**: 4G, 3G, offline transitions
- [ ] **Location testing**: GPS accuracy, fallback
- [ ] **Battery/thermal**: Long sessions, real-time updates

***

### **10. MONITORING \& LOGGING (NFR-18)**

#### 10.1 Client-Side Logging

- [ ] **Log levels**: DEBUG, INFO, WARN, ERROR
- [ ] **Structured logging**: JSON format for analysis
- [ ] **What to log**:
    - [ ] API calls (request, response, duration, error)
    - [ ] Errors with stack traces (no PII)
    - [ ] User actions (game creation, join, etc.)
    - [ ] Offline/online transitions
    - [ ] Sync operations (success, conflicts, failures)
    - [ ] Auth events (login, logout, token refresh)
- [ ] **Log rotation**: Limit local log size, upload to backend
- [ ] **Privacy**: Scrub locations, player IDs from logs where possible


#### 10.2 Remote Logging

- [ ] **Service choice**: Firebase Crashlytics, Sentry, custom backend
- [ ] **Crash reporting**: Automatic crash capture
- [ ] **Analytics**: User events, feature usage, retention
- [ ] **Error tracking**: Group by error type, frequency, affected users
- [ ] **Performance monitoring**: API latency, UI frame rates, app size


#### 10.3 Alerting

- [ ] **High-error-rate triggers**: Alert if sync/API fails > threshold
- [ ] **Performance alerts**: Response time degradation
- [ ] **Crash spike detection**

***

### **11. BACKEND ARCHITECTURE (Decisions for Your App)**

#### 11.1 Backend Service Choice

- [ ] **Option A: Firebase**
    - ✅ Realtime Database or Firestore
    - ✅ Authentication
    - ✅ Cloud Messaging
    - ✅ Cloud Functions for logic
    - ❓ Cost scaling
- [ ] **Option B: Supabase** (PostgreSQL + auth + real-time)
    - ✅ Open-source, self-hostable
    - ✅ Real-time via Realtime server
    - ✅ PostgreSQL for complex queries
    - ❌ Smaller ecosystem than Firebase
- [ ] **Option C: Custom REST/GraphQL** (Node, .NET, Python)
    - ✅ Full control
    - ❌ More maintenance, deployment complexity
- [ ] **Your choice**: Document reasoning
- [ ] **Database structure**:
    - [ ] Users, Games, Courts, Teams, Rankings, Messages, Notifications, Logs
    - [ ] Indexes for common queries (games by court, by user, ranking queries)
    - [ ] Full-text search for courts/players


#### 11.2 Real-Time Backend Components

- [ ] **WebSocket server or managed service** for occupancy, chat, game updates
- [ ] **Pub/Sub system**: RabbitMQ, Kafka, or cloud equivalent
- [ ] **Message queues**: For delayed tasks (notifications, ranking updates)


#### 11.3 Admin Console/Moderation

- [ ] **Backend admin API**: Approve courts, handle reports, ban users
- [ ] **Logging \& analytics**: Centralized logs accessible by admins

***

### **12. DEPLOYMENT \& CI/CD**

#### 12.1 Build \& Distribution

- [ ] **CI/CD pipeline**: GitHub Actions, Firebase Test Lab, or equivalent
- [ ] **Build variants**: Dev, staging, production
- [ ] **Version strategy**: Semantic versioning
- [ ] **App stores**: Google Play, Apple App Store submission process
- [ ] **Signing**: App signing certificates, key management
- [ ] **Feature flags**: Gradual rollouts, A/B testing


#### 12.2 App Updates

- [ ] **Update strategy**: Forced vs optional, backward compatibility
- [ ] **Migration handling**: New schema versions, data migrations
- [ ] **Rollback plan**: How to handle bad releases

***

### **13. ARCHITECTURE DIAGRAMS TO CREATE**

#### 13.1 Layered Architecture Diagram

- [ ] Presentation (Compose UI)
- [ ] Domain (Use cases, entities)
- [ ] Data (Repositories, DB, API)
- [ ] Show dependencies (arrows pointing down)


#### 13.2 Data Flow Diagram

- [ ] User action → State update → API call → Response → Cache → UI update
- [ ] Offline flow branching


#### 13.3 Offline/Sync Architecture

- [ ] Local DB ↔ Sync engine ↔ Remote API
- [ ] Conflict resolution flow


#### 13.4 Real-Time Architecture

- [ ] WebSocket/Pub-Sub connections
- [ ] How occupancy, chat, notifications pushed to clients


#### 13.5 Security \& Privacy Flow

- [ ] Auth flow (login, token storage, refresh)
- [ ] Data encryption points
- [ ] Permission requests


#### 13.6 Component Diagram

- [ ] Key classes/objects: Repositories, ViewModels, Use Cases
- [ ] Dependencies between components

***

### **14. CROSS-CUTTING CONCERNS**

#### 14.1 Error Handling Strategy

- [ ] **Exception hierarchy**: Custom exceptions for domain errors
- [ ] **Error mapping**: Backend errors → User-friendly messages
- [ ] **Recovery**: Auto-retry, fallback, user intervention


#### 14.2 Dependency Injection

- [ ] **Framework choice**: Koin (for KMP) or manual
- [ ] **Scope management**: Singleton, scoped, transient


#### 14.3 Concurrency \& Threading

- [ ] **Coroutines**: For async operations (network, DB)
- [ ] **Thread safety**: Shared state protection
- [ ] **Main thread dispatch**: UI updates on correct thread


#### 14.4 Code Organization

- [ ] **Package structure**: Feature-based vs layer-based
- [ ] **Naming conventions**: Consistent across iOS/Android
- [ ] **Documentation**: ADRs, inline comments for complex logic

***

### **15. SPECIFIC DECISIONS FOR YOUR NFRs**

#### Mapping NFRs to Architecture Decisions

| NFR | Architecture Decision |
| :-- | :-- |
| **NFR-01** (Offline) | Local DB with sync engine, cache strategy |
| **NFR-02** (Data Consistency) | Transaction support, crash recovery, WAL journals |
| **NFR-03** (Graceful Degradation) | Error handling layer, circuit breaker, cache fallback |
| **NFR-04** (Auth) | OAuth2 flow, token management, secure storage |
| **NFR-05** (GDPR) | Consent flow, data minimization, user rights API |
| **NFR-06** (TLS 1.3) | HTTPS enforcement, certificate pinning option |
| **NFR-07** (Location Privacy) | Server-side proximity validation, never send user coords |
| **NFR-08** (Learnability) | Onboarding flow, empty states with guidance |
| **NFR-09** (Error Feedback) | Error message templates, non-technical language |
| **NFR-13** (GPS) | Background location handling, fallback to manual entry |
| **NFR-14** (Maps) | Native maps integration, marker clustering |
| **NFR-20** (Camera) | Native camera access with expect/actual |
| **NFR-21** (Encryption) | E2E encryption library, key exchange protocol |


***

## **SUMMARY: IMMEDIATE NEXT STEPS**

1. **Create diagrams** for each section above (especially 13.1-13.6)
2. **Document your choices** for each decision point (backend, real-time, etc.)
3. **Define sync strategy** in detail (critical for offline features)
4. **Plan notification flow** end-to-end
5. **Create entity/domain models** with relationships
6. **Design API contracts** (REST/GraphQL endpoints)
7. **Map features to layers** (which use case, which repo, which API call)
8. **Plan testing coverage** for key offline scenarios

***

This checklist ensures your **KMP Compose app** is architecturally sound, handles your offline requirements, meets your NFRs, and scales. Use this as your guide for writing ADRs later if needed.
<span style="display:none">[^1][^2]</span>

<div align="center">⁂</div>

[^1]: Jira_Stories_Detailed.md

[^2]: nfr.md

