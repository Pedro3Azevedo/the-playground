# 01 - Mobile development approach

The application must target both Android and iOS (NFR-11) while ensuring high maintainability and testability.

### Considered Options

- Native (Java/Kotlin + Swift/Obj-C)
- Flutter
- React Native
- Kotlin Multiplatform + Compose Multiplatform

### Decision Outcome and Consequences

Kotlin Multiplatform for business logic and Compose Multiplatform for UI, is the best option as all the code is written in Kotlin and shared across platforms, still being able to use platform specific APIs.

Single Source of Truth (NFR-02): By sharing the Data and Domain layers, ensures that both iOS and Android behave exactly the same regarding data consistency and offline syncing.
Native Performance (NFR-13, NFR-20): KMP compiles to native code (JVM bytecode for Android, Native binary for iOS). This allows direct, high-performance access to GPS and Camera hardware.
Development Velocity: A solo developer can build features for both platforms once. The declarative nature of Compose accelerates UI development.
Academic Innovation: Kotlin Multiplatform was announced in 2017 and Compose Multiplatform first release was 2021, so it is still new compared with other, however, is already in a good phase to experiment and innovate.

It is a better option than React as rely on a Bridge causing bottlenecks for Real-Time data.
Is better option than Flutter, as the native services integration work better.

However, it is still evolving.

# 02 - Architecture Design Patterns

There are different architecture patterns for the frontend of the mobile application.
Android Developers recommends an architecture with a UI Layer, a Data Layer and optionally a Domain Layer.  

### Considered Options:

- MVC: Model-View-Controller
- MVP: Model-View-Presenter
- MVVM: Model-View-ViewModel
- MVI: Mode-View-Intent
- VIPER: View-Interactor-Presenter-Entity-Router

### Decision Outcome and Consequences

For this project the best pattern to use is the MVVM, which is seperated into three parts:

- View: Is the responsible for the UI and the presentation to the user, it informs the ViewModel of user actions, and observes the ViewModel, and does not contain any application logic
- ViewModel: Exposes the data that the View is observing, serving a link between the Model and the View;
- Model: abstracts the data sources, working together with ViewModel to get and save data, has the business logic of the app

With MVVM, there is clear separation between the UI and the logic, enabling a better development and testing, as it is not needed the View(UI) to test the logic.
The code is also cleaner, making it easier to understand adn maintain (NFR-15). Makes it easy to understand where to add new features.

However, MVVM can be complex for large projects and harder do debug

In Android's Developers documentation recommends and references the use of ViewModel.

Another good option would be MVI, where instead of the ViewModel is the Intent which represents the user actions and intentions and the View catches them sending them to the model.
So the user would interact with the Intent, teh Model would process the action and make the updates and then the View alters the state and present to the Users


## 03 - Backend: Strategy

For mobile application, the backend can be a custom one, using a Mobile Backend as a Service (MBaaS) or a hybrid approach.
Using a MBaaS is a better solution for this project as it becomes faster the backend development, giving more time ot focus on the core of the project.
A MBaaS can have a several built-in features, including user management, real-time synchronization, storage and databases.

### Considered Options

- Google's Firebase
- Supabase
- Parse
- Back4App
- AWS Amplify
- Azure

### Decision Outcome and Consequences

For this project, the MBaaS that was chosen is Supabase.
Supabase is an open source MBaaS several services available that will help with the project, including PostgreSQL Database that can handle complex relationship connections while offering built-in realtime features for the project realtime updates.
Besides that, it has authentication, storage, and server-side functions. However, lacks native push notifications adn mobile analytics, which forces third-party tools integrations.

Supabase can be self-hosted or use theirs services that has different pricing options, with the free tier being enough for this project, as it has a limit of 50,000 monthly active users.
Besides that, comparing to others, it is not a "black box" being easy to debug. It has also less vendor lock-in, with a PostgresSQL database it can be run anywhere and can be exported.


## 04 - Backend: Local Database

To enable offline features and faster data access, it is important to have a local database that will be synced with the remote database, whenever there is network connection and updates are needed.

### Considered Options

- Room
- SQLDelight
- Realm
- Data Store

### Decision Outcome and Consequences

Room is a part of Android Jetpack suite, making a good option for this project. It is an abstraction of SQLite database, that integrates naturally with flows and coroutines, providing a annotation-based API.
It has slight more boilerplate with entities and DAOs, and less control over raw SQL than SQLDelight, making debugging complex queries harder. 
However, it is simpler to learn than SQLDelight and works better with Android development tools provided by Google, with stronger support through LiveData and Flow integration, automatically changing the UI data when there are changes.


## 05 - API Client

In order for the application communicate with the external Supabase backend, there should be an API Client to make the calls.

### Considered Options

- Supabase Kotlin Client
- Ktor

### Decision Outcome and Consequences

Ktor looks like to be the standard and recommend HTTP client, has multiple examples from Google, Jetbrain and other communities use Ktor as example in Kotlin Multiplatform projects.
Another good option would be the Supabase Kotlin Client, however, this would make the application dependable of Supabase and if later the MBaaS was replaced, more code have to be written.
With this, a little more code needs to be developed with Ktor, than Supabase Kotlin Client, but ideal to not get vendor lock-in. 
