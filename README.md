# BORING APP

A boring_app project created in Flutter using Domain-Driven-Desing, Provider, BLoC, Firebase Firestore and many more. Mobiles supported.
## Getting Started

The BoringApp app allows user to write notes and tasks, check which is done, delete and edit. All data is stored in user's account in Firebase Server. 

## Installation

1. Clone or download the repo
	git clone https://github.com/fylyppo/live_football.git
2. Install packages
	flutter pub get
  
## Appearance

![Artboard – 5](https://user-images.githubusercontent.com/63547653/174270066-b458a3b6-d19a-46c7-956a-7c927f5ae5b8.png)

## Features

- Home
- Dependency Injection with Injectable and GetIt
- Dartz
- BLoC
- Provider
- UUID
- Flutter Hooks
- Code Generation: 
  - Routing with AutoRoute
  - Freezed and JsonSerializable
  - Injectable
- TDD with Mocktail

## Folder Structure

lib/

|- application/

|- domain/

|- infrastructure/

|- presentation


### Application Structure

application/

- |- auth/blocs
- |- notes/blocs

### Domain Structure

domain/

- |- auth/
- |- core/
- |- notes/

### Infrastructure Structure

domain/

- |- auth/
- |- core/
- |- notes/

### Presentation Structure

domain/

- |- core/
- |- notes/
- |- routes/
- |- sign_in/
- |- splash/
