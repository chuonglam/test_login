# The app's data layer

## Features

This package has the responsibility of working with a fake server for logging in service.

## Folder Structure
```
|- data/
    |- lib/
        |- src/
            |- entities     (contains classes mapped from models)
            |- models   (contains api's response model)
            |- repositories (contains repositories' abstractions)
            |- responses    (contains api's response wrapper model, defined app's errors)
            |- services (contains class for logging in service)
            |- sl   (contains service locator setup)
        |- data.dart
    |- test (contains all Data package's unit tests)
```
The `data.dart` exposes the Data layer's api models, response models and repository abstractions.

## Run tests

```
flutter test data
```
