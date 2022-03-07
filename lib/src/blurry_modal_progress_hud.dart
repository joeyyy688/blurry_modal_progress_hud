import 'dart:ui';
import 'package:flutter/material.dart';

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [inAsyncCall]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The progress indicator can be positioned using [offset] otherwise it is
/// centered
///
/// The modal barrier can be dismissed using [dismissible]
///
/// The blurry effect's intensity can be be controlled using [blurEffectIntensity]
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// This is a rewritten version of the modal_progress_hud package with the blurry effect
///
class BlurryModalProgressHUD extends StatelessWidget {
  final bool? inAsyncCall;
  final double opacity;
  final Color color;
  final double blurEffectIntensity;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget? child;

  const BlurryModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.blurEffectIntensity = 1.0,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        assert(child is Widget),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child!);
    if (inAsyncCall == true) {
      Widget layOutProgressIndicator;
      if (offset == null) {
        layOutProgressIndicator = Center(child: progressIndicator);
      } else {
        layOutProgressIndicator = Positioned(
          child: progressIndicator,
          left: offset!.dx,
          top: offset!.dy,
        );
      }
      final modal = [
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: blurEffectIntensity, sigmaY: blurEffectIntensity),
          child: Opacity(
            child: ModalBarrier(dismissible: dismissible, color: color),
            opacity: opacity,
          ),
        ),
        layOutProgressIndicator,
      ];
      widgetList += modal;
    }
    return Stack(
      alignment: Alignment
          .bottomCenter, //causing slight problems **can restore anytime
      children: widgetList,
    );
  }
}
