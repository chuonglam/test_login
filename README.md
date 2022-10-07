# Flutter MVVM pattern demo

A test project created in Flutter using MVVM pattern and Provider as implementation. This supports both Android & iOS platform.

## Getting Started

This project uses Provider as a state management.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/chuonglam/test_login.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3 (optional):**

This project uses `get_it` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

**Note:** 
Credentials for testing app:

``` 
username: hello@example.com
password: 123456
```
## Total Efforts: 10 hrs

* Initiate project's structure, module and service locator: 1 hr
* Implement Data layer: 1.5 hrs
* Create UI, handle form's validation and events: 1 hr
* Apply MVVM pattern: 2 hrs
* Run test & fix bugs: 1 hr
* Write unit tests & refactor code: 2 hrs
* Write integration tests: 1 hr
* Update README.md: 0.5 hr

### Libraries & Tools Used

* [Provider](https://github.com/rrousselGit/provider)
* [Injectable](https://pub.dev/packages/injectable)
* [GetIt](https://github.com/fluttercommunity/get_it)
* [Mocktail](https://pub.dev/packages/mocktail)

### Run tests
For running Data layer's unit tests:
```
flutter test data
```

For running App layer's unit tests:
```
flutter test
```

For running integration tests:
```
flutter test integration_test
```

### Folder Structure
Here is the core folder structure.

```
test_login/
|- android
|- apk  (this folder contains the released apk file)
|- data (this is the app's data layer)
|- integration_test (contains all integration tests files)
|- ios
|- lib/
    |- common   (contains the common/extensions functions)
    |- sl   (contains sevice locator setup)
    |- ui   (contains all UIs of the app)
    |- main.dart
|- test (contains all App's unit tests)
```
