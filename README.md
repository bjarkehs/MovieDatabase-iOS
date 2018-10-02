# Installation

Make sure you have Homebrew: https://brew.sh

Once Homebrew is installed install Carthage and SwiftLint:

```sh
brew install carthage swiftlint
```

Once these are installed you'll have to install 3rd party libraries with Carthage:

```sh
carthage bootstrap --platform iOS
```

The `--platform iOS` is only to avoid having to compile more than necessary.

You are now ready to open `MovieDatabase.xcodeproj` and run the example.
