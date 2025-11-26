
# Non Functional Requirements

## Performance (PerfR)

- how fast the system responds and processes work
- Response time shows how long users wait for actions to complete
- Throughput measures how many transactions the system handles per second.
- Resource consumption tracks CPU, memory, and bandwidth usage.


## Scalability (ScaR)

- how well the system grows with demand.
- Vertical scaling adds more power to existing servers.
- Horizontal scaling adds more servers to distribute the load.
- specify scaling triggers and capacity targets
- system needs to scale up and down automatically based on demand


## Availability (AR)

- how reliably the system stays operational.
- expressed as uptime percentages
- Disaster recovery strategies, Redundancy architectures, Failover mechanisms.
- specify maximum downtime tolerances and recovery time objectives.
- cover maintenance windows
- Can the system get offline for updates, or does it need zero-downtime deployment strategies like blue-green deployments or rolling updates?

## Portability (PortR)

- how easily the software runs across different platforms, operating systems, browsers, or devices.
- specify compatibility targets
- Mobile apps face portability challenges around screen sizes, operating system versions, and device capabilities.
- Can your application move between AWS, Azure, and Google Cloud without major rewrites?
- Portability requirements influence technology stack choices. 

## Compatibility (CR)

- how well the system works with other software, legacy systems, APIs, or hardware.
- specify integration points and interoperability standards.

## Reliability (RR)

- how often the system fails and how gracefully it recovers.
- Metrics like Mean Time Between Failures and Mean Time To Recovery measure this.
- reliable system doesn’t crash every time something unexpected happens.
- handles errors, logs issues, and keeps running.
- these requirements drive architectural patterns like circuit breakers, bulkheads, and retry logic.
- Fault tolerance ties directly into reliability
- Can the system detect failures and isolate them before they cascade?

## Maintainability (MR)

- how easily developers can update, fix, or extend your system.
- Code quality, documentation, modular architecture, and development practices all factor in
- NFRs here might specify: All public APIs must include comprehensive documentation with code examples
- should specify logging formats, error tracking integrations, and monitoring dashboards.


## Security (SecR)

- protect data, prevent unauthorised access, and ensure compliance with regulations.
- specify encryption standards, authentication mechanisms, access controls, and compliance frameworks.
- explicitly reference applicable regulations and describe how the system achieves compliance

## Usability (UR)

- how easily users accomplish their goals.
- Interface design, accessibility, learnability, and overall user experience all matter.
- should reference standards

@misc{,
title = {Non-Functional Requirements: A Comprehensive Guide},
url = {https://aqua-cloud.io/understanding-non-functional-requirements-software-engineering/}
}




## Functional Suitability
This characteristic represents the degree to which a product or system provides functions that meet stated and implied needs when used under specified conditions. This characteristic is composed of the following sub-characteristics:

**Functional completeness** - Degree to which the set of functions covers all the specified tasks and intended users' objectives.
**Functional correctness** - Degree to which a product or system provides accurate results when used by intended users.
**Functional appropriateness** - Degree to which the functions facilitate the accomplishment of specified tasks and objectives.

## Performance Efficiency
This characteristic represents the degree to which a product performs its functions within specified time and throughput parameters and is efficient in the use of resources (such as CPU, memory, storage, network devices, energy, materials...) under specified conditions. This characteristic is composed of the following sub-characteristics:

**Time behaviour** - Degree to which the response time and throughput rates of a product or system, when performing its functions, meet requirements.
**Resource utilization** - Degree to which the amounts and types of resources used by a product or system, when performing its functions, meet requirements.
**Capacity** - Degree to which the maximum limits of a product or system parameter meet requirements.


## Compatibility
Degree to which a product, system or component can exchange information with other products, systems or components, and/or perform its required functions while sharing the same common environment and resources. This characteristic is composed of the following sub-characteristics:

**Co-existence** - Degree to which a product can perform its required functions efficiently while sharing a common environment and resources with other products, without detrimental impact on any other product.
**Interoperability** - Degree to which a system, product or component can exchange information with other products and mutually use the information that has been exchanged.


## Interaction Capability
Degree to which a product or system can be interacted with by specified users to exchange information ia the user interfaceto complete specific tasks in a variety of contexts of use. This characteristic is composed of the following sub-characteristics:

**Appropriateness recognizability** - Degree to which users can recognize whether a product or system is appropriate for their needs.
**Learnability** - Degree to which the functions of a product or system can be learnt to be used by specified users within a specified amount of time.
**Operability** - Degree to which a product or system has attributes that make it easy to operate and control.
**User error protection** -  Degree to which a system prevents users against operation errors.
**User engagement** - Degree to which a user interface presents functions and information in an inviting and motivating manner encouraging continued interaction.
**Inclusivity** - Degree to which a product or system can be used by people of various backgrounds (such as people of various ages, abilities, cultures, ethnicities, languages, genders, economic situations, etc.).
**User assistance** - Degree to which a product can be used by people with the widest range of characteristics and capabilities to achieve specified goals in a specified context of use.
**Self-descriptiveness** - Degree to wich a product presents appropriate information, where needed by the user, to make its capabilities and use immediately obvious to the user without excessive interactions with a product or other resources (such as user documentation, help desks or other users).

## Reliability
Degree to which a system, product or component performs specified functions under specified conditions for a specified period of time. This characteristic is composed of the following sub-characteristics:

**Faultlessness** - Degree to which a system, product or component performs specified functions without fault under normal operation.
**Availability** - Degree to which a system, product or component is operational and accessible when required for use.
**Fault tolerance** - Degree to which a system, product or component operates as intended despite the presence of hardware or software faults.
**Recoverability** - Degree to which, in the event of an interruption or a failure, a product or system can recover the data directly affected and re-establish the desired state of the system.

## Security
Degree to which a product or system defends against attack patterns by malicious actos and protects information and data so that persons or other products or systems have the degree of data access appropriate to their types and levels of authorization. This characteristic is composed of the following sub-characteristics:

**Confidentiality** - Degree to which a product or system ensures that data are accessible only to those authorized to have access.
**Integrity** - Degree to which a system, product or component ensures that the state of its system and data are protected from unauthorized modification or deletion either by malicious action or computer error.
**Non-repudiation** - Degree to which actions or events can be proven to have taken place so that the events or actions cannot be repudiated later.
**Accountability** - Degree to which the actions of an entity can be traced uniquely to the entity.
**Authenticity** - Degree to which the identity of a subject or resource can be proved to be the one claimed.
**Resistance** - Degree to which the product or system sustains operations while under attack from a malicious actor.


## Maintainability
This characteristic represents the degree of effectiveness and efficiency with which a product or system can be modified to improve it, correct it or adapt it to changes in environment, and in requirements. This characteristic is composed of the following sub-characteristics:

**Modularity** - Degree to which a system or computer program is composed of discrete components such that a change to one component has minimal impact on other components.
**Reusability** - Degree to which a product can be used as an asset in more than one system, or in building other assets.
**Analysability** - Degree of effectiveness and efficiency with which it is possible to assess the impact on a product or system of an intended change to one or more of its parts, to diagnose a product for deficiencies or causes of failures, or to identify parts to be modified.
**Modifiability** - Degree to which a product or system can be effectively and efficiently modified without introducing defects or degrading existing product quality.
**Testability** - Degree of effectiveness and efficiency with which test criteria can be established for a system, product or component and tests can be performed to determine whether those criteria have been met.

## Flexibility
Degree to which a product can be adapted to changes in its requirements, contexts of use or sys tem environment. This characteristic is composed of the following sub-characteristics:

**Adaptability** - Degree to which a product or system can effectively and efficiently be adapted for or transferred to different hardware, software or other operational or usage environments.
**Scalability** - Degree to which a product can handle growing or shrinking workloads or to adapt its capacity to handle variability.
**Installability** - Degree of effectiveness and efficiency with which a product or system can be successfully installed and/or uninstalled in a specified environment.
**Replaceability** - Degree to which a product can replace another specified software product for the same purpose in the same environment.

## Safety
This characteristic represents the degree to which a product under defined conditions to avoid a state in which human life, health, property, or the environment is endangered. This characteristic is composed of the following sub-characteristics:

**Operational constraint** - Degree to which a product or system constrains its operation to within safe parameters or states when encountering operational hazard.
**Risk identification** - Degree to which a product can identify a course of events or operations that can expose life, property or environment to unacceptable risk.
**Fail safe** - Degree to which a product can automatically place itself in a safe operating mode, or to revert to a safe condition in the event of a failure.
**Hazard warning** - Degree to which a product or system provides warnings of unacceptable risks to operations or internal controls so that they can react in sufficient time to sustain safe operations.
**Safe integration** - Degree to which a product can maintain safety during and after integration with one or more components.

@misc{,
title = {ISO 25010},
url = {https://iso25000.com/index.php/en/iso-25000-standards/iso-25010}
}


# Non-Functional Requirements List

### NFR-01: Offline Availability

**Requirement:** The application shall support offline access to previously loaded data, informing when the user is offline and the last updated timestamp.
**Priority:** Must Have
**ISO-25010:** Reliability(Availability, Fault Tolerance)

### NFR-02: Data Consistency 

**Requirement:** The application shall not data loss after a write operation, even if a crash or an unexpected termination occur.
**Priority:** Must Have
**ISO-25010:** Reliability(Faultlessness, Recoverability)

### NFR-03: Graceful Degradation 

**Requirement:** In case of a failed backend request, the application shall:
1. Display cached data when available
2. Show a clear, user-friendly error message
3. Never crash or display technical error details to the user
4. Allow retry when appropriate
**Priority:** Should Have
**ISO-25010:** Reliability(Fault Tolerance)

### NFR-04: User Authentication 

**Requirement:** The application shall allow users to authenticate via social login or email/password. 
**Priority:** Must Have
**ISO-25010:** Security(Authenticity, Confidentiality)

### NFR-05: Data Privacy (GDPR Compliance) 

**Requirement:** The application shall comply with GDPR requirements such as explicit user consent before data collection, data minimization, user right to access/delete data, transparent privacy policy. Location data used only for real time search, not stored long term.
**Priority:** Must Have
**ISO-25010:** Security(Confidentiality, Integrity)

### NFR-06: Secure Data Transmission 

**Requirement:** The application shall transmit data between client and backend using HTTPS with TLS 1.3.
**Priority:** Must Have
**ISO-25010:** Security(Confidentiality, Integrity)

### NFR-07: Location Privacy 

**Requirement:** The application shall never expose to other users the user location coordinates, only hte location of the court should be shared publicly.
**Priority:** Must Have
**ISO-25010:** Security(Confidentiality)

### NFR-08: Learnability 

**Requirement:** The application shall enable new users to complete core tasks without prior training or documentation
**Priority:** Must Have
**ISO-25010:** Interaction Capability(Learnability)

### NFR-09: Error Feedback 

**Requirement:** The application shall provide a clear, descriptive error message when a user action fails explaining why.
**Priority:** Should Have
**ISO-25010:** Interaction Capability(Self-descriptiveness, User error protection)

### NFR-10: Outdoor Readability 

**Requirement:** The application shall remain readable in outdoor sunlight conditions through high contrast UI and support for system dark/light modes.
**Priority:** Could Have
**ISO-25010:** Interaction Capability(Operability)

### NFR-11: Cross-Platform Support 

**Requirement:** The application shall run on both Android and iOS platform
**Priority:** Must Have
**ISO-25010:** Flexibility(Adaptability)

### NFR-12: Screen Compatability

**Requirement:** The application shall function correctly on devices with varying screen sizes and capabilities, for only phones.
**Priority:** Should Have
**ISO-25010:** Flexibility(Adaptability)

### NFR-13: GPS Integration 

**Requirement:** The application shall integrate with device's native GPS/GNSS hardware for location services
**Priority:** Must Have
**ISO-25010:** Compatability(Interoperability)

### NFR-14: Device Services Integration 

**Requirement:** Application shall integrate with device calendar and map services, to export game events and open court location.
**Priority:** Could Have 
**ISO-25010:** Compatability(Co-existence, Interoperability)

### NFR-15: Code Modularity 

**Requirement:** The application shall follow a clean architecture principles with separation between presentation, domain, and data layers. Changes to one module shall have minimal impact on others.
**Priority:** Should Have
**ISO-25010:** Maintainability(Modularity, Modifiability)

### NFR-16: Testability

**Requirement:** The application shall have unit test for core business logic. Acceptance test shall be written for user stories and followed a ATDD methodology.
**Priority:** Should Have
**ISO-25010:** Maintainability(Testability)

### NFR-17: Documentation 

**Requirement:** The application shall be complemented with documentation for APIs and business logic.
**Priority:** Should Have
**ISO-25010:** Maintainability(Analysability)

### NFR-18: Logging 

**Requirement:** The application shall generate centralized logs for failures and errors, structured for analysis.
**Priority:** Should Have
**ISO-25010:** Maintainability(Analysability)

### NFR-19: User Moderation 

**Requirement:** The application shall include report features, to report players and events to mitigate harassment or unsafe gatherings.
**Priority:** Could Have
**ISO-25010:** Safety(Risk identification)
