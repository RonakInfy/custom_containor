# custom_containor

A beautiful and animated bottom navigation. The navigation bar use your current theme, but you are free to customize it.

## Features :
* Supports any widget as as a bottom bar children.
* Animates the notch toward selected item.
* Create an optimized bottom navigation bar with beautiful animation.

<img src="https://drive.google.com/file/d/1-DwZAZulyD6l6QuRVeDUveMARolpDq7i/view?usp=sharing" > 

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  custom_containor: 0.0.1
```
## Basic Usage

Place `AnimatedNotchBottomBar` in the bottomNavigationBar parameter of a `Scaffold` widget and provide `NotchBottomBarController` to `AnimatedNotchBottomBar`.

```dart
bottomNavigationBar:  CustomContainer(
  ...
)
```

