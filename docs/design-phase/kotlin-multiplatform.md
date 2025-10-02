# Kotlin Multiplatform

## Shared code

With Kotlin Multiplatform, developers can share code across multiple platforms, Android, iOS, Web and Desktop, still alowing platform-specific personalization. The shared codebase will handle business logic (calculation, algorithms), data models (classe, data structures) and utility functions (helper methods). While platform-specific code handles the unique features of each platform, such as device capabilities and UI designs (if not using Compose Multiplatform).

Example: For authentication, the logic and the code is in the shared module, and to access the camera, it writen in platform-specific code for Android and iOS, using each different camera API, while serving the same function.

There are certain dependencies (libraries or SDKs) that can be share in the shared code module, but it is still possible to have libreries that are only needed for one platform, platform-specific dependecies, added in the platform specific module. Ktor and SQLDelight are libraries that can be shared.

[reference] book