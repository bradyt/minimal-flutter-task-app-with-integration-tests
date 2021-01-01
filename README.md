This repo is a minimal example of an Android and iOS flutter app using
[taskd-client-dart](https://github.com/bradyt/taskd-client-dart).

It can be tested interactively in a device emulator, or you can run
the integration test.

The app assumes you are using
[taskd-setup-dart](https://github.com/bradyt/taskd-setup-dart) to
serve taskd on localhost, as instructed below.

To install `taskd-setup-dart`, you can use the following,

```sh
dart pub global activate -sgit https://github.com/bradyt/taskd-setup-dart.git
```

Except for the docker approach, you will need to install taskwarrior
and taskd. For Windows, you would install them in WSL.

# Running the flutter app

Running the flutter app interactively:

```sh
flutter run
```

Running integration tests:

```sh
flutter drive --driver integration_test/driver.dart --target integration_test/app_test.dart
```

# Running a taskd server on localhost

The flutter app uses a taskd server running on localhost. Below are
notes on running that server for the app to connect to.

If you are using Android, you will need to replace `taskd-setup` with
the following,

```sh
taskd-setup --CN=10.0.2.2 --address=127.0.0.1
```

Note the flutter app automatically connects to `10.0.2.2` when running
in Android.

## macOS and GNU/Linux

```sh
cd fixture
taskd-setup
make
```

## Windows

Open Debian in WSL in Terminal.exe.

Debian is recommended as their package manager provides taskd.

```sh
cd fixture
taskd-setup
make
```

## Docker

```sh
cd docker
make
```
