# blurry_modal_progress_hud

### This is a clone and upgrade of [modal_progress_hud](https://pub.dev/packages/modal_progress_hud)

Just like [modal_progress_hud](https://pub.dev/packages/modal_progress_hud) this is a simple widget wrapper to enable modal progress hud (a modal progress indicator, hud = heads up display)

## How it works 

![Image1](https://github.com/joeyyy688/blurry_modal_progress_hud/blob/master/blurry_modal_progress_hud_image1.gif)


![Image2](https://github.com/joeyyy688/blurry_modal_progress_hud/blob/master/blurry_modal_progress_hud_image2.gif)


*See [example](https://github.com/joeyyy688/blurry_modal_progress_hud/tree/master/exmaple) for details*


## Installation

Add the blurry_modal_progress_hud package to your `pubspec.yml` file.

```yml
dependencies:
  blurry_modal_progress_hud: ^1.0.0
```

Import the package into your dart file

```dart
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
```

## Usage

```dart
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.

/// The progress indicator can be turned on or off using [inAsyncCall]

/// The blurry effect's intensity can be be controlled using [blurEffectIntensity]

/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget. For this example the SpinKitFadingCircle package is used

/// The modal barrier can be dismissed using [dismissible]

/// The opacity of the modal barrier can be set using [opacity]

/// The color of the modal barrier can be set using [color]

/// The progress indicator can be positioned using [offset] otherwise it is
/// centered

BlurryModalProgressHUD(
    inAsyncCall: isLoading,  
    blurEffectIntensity: 4,
    progressIndicator: SpinKitFadingCircle(
    color: purpleColor,
    size: 90.0,
    ),
    dismissible: false,
    opacity: 0.4,
    color: black97Color,
    child: Scaffold(),
);
```

## Options
Most of the parameters can be customized via the constructor

```dart
  BlurryModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.blurEffectIntensity = 1.0,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  });
```


## Example

*See the [example](https://github.com/joeyyy688/blurry_modal_progress_hud/tree/master/exmaple) for a complete sample app using the blurry_modal_progress_hud*

### Contact
Reach me on Twitter <a href="https://twitter.com/edinjoey" target="_blank">@edinjoey</a>