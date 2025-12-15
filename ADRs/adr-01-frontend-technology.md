# Frontend Technology

## Context and Problem Statement

The project is focused on a complex, real-time mobile application with strict constraints regarding offline capability (NFR-01), data consistency (NFR-02), and deep integration with native device hardware (Camera, GPS, Calendar).
The application must target both Android and iOS (NFR-11) while ensuring high maintainability and testability.

## Considered Options

* Native (Java/Kotlin + Swift/Obj-C)
* Flutter
* React Native
* Kotlin Multiplatform + Compose Multiplatform

## Decision Outcome

Kotlin Multiplatform for business logic and Compose Multiplatform for UI, is the best option as all the code is written in Kotlin and shared across platforms, still being able to use platform specific APIs.
### Consequences

Single Source of Truth (NFR-02): By sharing the Data and Domain layers, ensures that both iOS and Android behave exactly the same regarding data consistency and offline syncing.
Native Performance (NFR-13, NFR-20): KMP compiles to native code (JVM bytecode for Android, Native binary for iOS). This allows direct, high-performance access to GPS and Camera hardware.
Development Velocity: A solo developer can build features for both platforms once. The declarative nature of Compose accelerates UI development.
Academic Innovation: Kotlin Multiplatform was announced in 2017 and Compose Multiplatform first release was 2021, so it is still new compared with other, however, is already in a good phase to experiment and innovate.

It is a better option than React as rely on a Bridge causing bottlenecks for Real-Time data.
Is better option than Flutter, as the native services integration work better.

However, it is still evolving.
